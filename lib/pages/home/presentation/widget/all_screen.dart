import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/bloc/state/recipe_state.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/localdb/recipe_db.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';
import 'package:stove_genie/utils/colors.dart';
import 'package:stove_genie/utils/images.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  final cubit = Di().sl<RecipeCubit>();
  final Set<String> savedRecipeIds = {}; // Track saved recipes

  Future<void> _loadSavedRecipes() async {
    final recipes = await RecipeDbHelper().getRecipes();
    setState(() {
      savedRecipeIds.addAll(recipes.map((e) => e.id));
    });
  }

  Future<void> _toggleSave(RecipeModel recipe) async {
    final isSaved = savedRecipeIds.contains(recipe.id);

    if (isSaved) {
      await RecipeDbHelper().deleteRecipe(recipe.id);
      savedRecipeIds.remove(recipe.id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${recipe.title} removed from favorites'),
        backgroundColor: Colors.orange,
      ));
    } else {
      await RecipeDbHelper().insertRecipe(recipe);
      savedRecipeIds.add(recipe.id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${recipe.title} saved to favorites'),
        backgroundColor: Colors.red,
      ));
    }

    setState(() {});
  }

  Future<void> fetchRecipe() async {
    await cubit.fetchRecipe();
    _loadSavedRecipes();
  }

  @override
  void initState() {
    super.initState();
    fetchRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is RecipeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RecipeError) {
          return Center(child: Text('Error loading recipes'));
        }

        if (state is RecipeLoaded) {
          final recipes = cubit.recipeData;

          if (recipes.isEmpty) {
            return Center(child: Text('No recipes found'));
          }

          return SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: recipes.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 30 : 15),
                  child: _buildRecipeCard(recipe),
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget _buildRecipeCard(RecipeModel recipe) {
    return Stack(children: [
      Column(
        children: [
          const SizedBox(height: 40),
          Container(
            height: 160,
            width: 150,
            decoration: BoxDecoration(
              color: AppColors.containeColor.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 5),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      recipe.title,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.resipetextColor),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        recipe.category,
                        style: GoogleFonts.poppins(
                            color: AppColors.cheifColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.flameIcon),
                        ],
                      ),
                      Text(
                        '${recipe.calories} KCal',
                        style: GoogleFonts.poppins(
                            color: AppColors.falmetextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        '${recipe.time} Mins',
                        style: GoogleFonts.poppins(
                            color: AppColors.resipetextColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => _toggleSave(recipe),
                            child: SvgPicture.asset(
                              AppImages.saveselected,
                              color: savedRecipeIds.contains(recipe.id)
                                  ? Colors.red
                                  : Colors.orange,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Positioned(
        bottom: 160,
        left: 40,
        child: Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: recipe.image.isNotEmpty
                ? Image.network(recipe.image, fit: BoxFit.cover)
                : Image.asset('assets/images/menu.png'),
          ),
        ),
      ),
      Positioned(
        top: 30,
        left: 105,
        child: Container(
          width: 40,
          height: 23,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: AppColors.rateContainerColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/rate_star.svg'),
                ],
              ),
              const SizedBox(width: 5),
              Text(
                recipe.rating.toStringAsFixed(1),
                style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
