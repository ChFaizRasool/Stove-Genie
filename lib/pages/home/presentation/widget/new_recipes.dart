import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/bloc/state/recipe_state.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';

class NewRecipes extends StatelessWidget {
  NewRecipes({super.key});

  final _recipeCubit = Di().sl<RecipeCubit>();

  Future<Map<String, dynamic>?> getUserDetails(String userId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      bloc: _recipeCubit,
      builder: (context, state) {
        if (state is RecipeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecipeLoaded) {
          final List<RecipeModel> recipes = _recipeCubit.recipeData;

          return ListView.builder(
            padding: const EdgeInsets.only(left: 30),
            itemCount: recipes.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return FutureBuilder<Map<String, dynamic>?>(
                future: getUserDetails(recipe.userId),
                builder: (context, snapshot) {
                  String userName = 'Unknown';
                  String userProfile = 'assets/images/cheif_profile.png';

                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    userName = snapshot.data?['name'] ?? 'Unknown';
                    userProfile = snapshot.data?['profileImage'] ??
                        'assets/images/cheif_profile.png';
                  }

                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: 95,
                                width: 251,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        recipe.title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.resipetextColor,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: List.generate(
                                              recipe.rating.round(),
                                              (index) => const Icon(Icons.star,
                                                  color: Color(0xffffad30),
                                                  size: 14),
                                            ),
                                          ),
                                          const Spacer(),
                                          SvgPicture.asset(AppImages.flameIcon),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${recipe.calories} KCal',
                                            style: GoogleFonts.poppins(
                                              color: AppColors.falmetextColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 24,
                                            width: 24,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child:
                                                userProfile.startsWith('assets')
                                                    ? Image.asset(userProfile)
                                                    : ClipOval(
                                                        child: Image.network(
                                                          userProfile,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              const Icon(
                                                                  Icons.person,
                                                                  size: 20),
                                                        ),
                                                      ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'By $userName',
                                            style: GoogleFonts.poppins(
                                              color: AppColors.cheifColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Spacer(),
                                          SvgPicture.asset(AppImages.timerIcon),
                                          const SizedBox(width: 4),
                                          Text(
                                            recipe.time,
                                            style: GoogleFonts.poppins(
                                              color: AppColors.cheifColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 95,
                          left: 170,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: ClipOval(
                              child: Image.network(
                                recipe.image,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset('assets/images/menu.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        } else if (state is RecipeError) {
          return const Center(child: Text('Something went wrong.'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
