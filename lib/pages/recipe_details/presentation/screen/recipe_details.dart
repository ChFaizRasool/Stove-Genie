import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/ingredients.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/procedure.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/rate_recipe.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/recipe_dialog.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/user_account.dart';
import 'package:stove_genie/pages/reviews_screen/presentation/screen/reviews_screen.dart';
import 'package:stove_genie/pages/saved_recipes/presentation/widget/recipe_container.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    if (recipe == null) {
      return Center(child: Text("No recipe selected"));
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          actions: [
            PopupMenuButton<int>(
              icon: const Icon(Icons.more_horiz_outlined, color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              onSelected: (value) {
                switch (value) {
                  case 0:
                    showRecipeDialog(context, 'https://www.example.com/recipe');
                    break;
                  case 1:
                    showRateRecipeDialog(context, onSubmit: (rating) {
                      final userId = FirebaseAuth.instance.currentUser?.uid;
                      final recipeId = recipe?.id;

                      if (userId != null && (recipeId?.isNotEmpty ?? false)) {
                        FirebaseFirestore.instance
                            .collection('recipes')
                            .doc(recipeId)
                            .update({
                          'reviews': FieldValue.arrayUnion([
                            {
                              'userId': userId,
                              'rating': rating,
                              'timestamp': DateTime.now().toIso8601String(),
                            }
                          ])
                        });
                      } else {
                        debugPrint("User ID or Recipe ID is null or empty");
                      }
                    });

                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReviewsScreen(),
                      ),
                    );
                    break;
                  case 3:
                    break;
                }
              },
              itemBuilder: (context) => [
                _buildMenuItem(Icons.share, "Share", 0),
                _buildMenuItem(Icons.star, "Rate Recipe", 1),
                _buildMenuItem(Icons.comment, "Review", 2),
                _buildMenuItem(Icons.bookmark, "Unsave", 3),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Column(
              children: [
                RecipeContainer(
                  imgPath: recipe?.image,
                  rating: recipe?.rating.toString(),
                  time: recipe?.time,
                  showButton: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          recipe?.title ?? '',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "(13k Reviews)",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xffa3a3a3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            UserAccountWidget(userId: recipe?.userId ?? ''),
            const SizedBox(height: 20),
            TabBar(
              physics: const NeverScrollableScrollPhysics(),
              isScrollable: false,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: const Color(0xFFFFA307),
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xFFFFA307),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              tabs: const [
                Tab(child: Text('INGREDIENT')),
                Tab(child: Text('PROCEDURE')),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Ingredients(
                    ingredients: recipe?.ingredients ?? [],
                  ),
                  Procedure(steps: recipe?.steps ?? []),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<int> _buildMenuItem(IconData icon, String text, int value) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}

final recipe = Di().sl<RecipeCubit>().singleRecipeData;
