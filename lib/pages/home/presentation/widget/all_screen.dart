import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/bloc/state/recipe_state.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/localdb/recipe_db.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';
import 'package:stove_genie/pages/recipe_details/presentation/screen/recipe_details.dart';
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
  bool isLoadingSaved = false;

  Future<void> _loadSavedRecipes() async {
    try {
      setState(() {
        isLoadingSaved = true;
      });

      final recipes = await RecipeDbHelper().getRecipes();
      if (mounted) {
        setState(() {
          savedRecipeIds.clear();
          savedRecipeIds.addAll(recipes.map((e) => e.id));
          isLoadingSaved = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoadingSaved = false;
        });
        _showErrorSnackBar('Error loading saved recipes: ${e.toString()}');
      }
    }
  }

  Future<void> _toggleSave(RecipeModel recipe, int index) async {
    try {
      final isSaved = savedRecipeIds.contains(recipe.id);

      if (isSaved) {
        await RecipeDbHelper().deleteRecipe(recipe.id);
        if (mounted) {
          setState(() {
            savedRecipeIds.remove(recipe.id);
          });
          _showSuccessSnackBar(
              '${recipe.title} removed from favorites', Colors.orange);
        }
      } else {
        await RecipeDbHelper().insertRecipe(recipe);
        if (mounted) {
          setState(() {
            savedRecipeIds.add(recipe.id);
          });
          _showSuccessSnackBar(
              '${recipe.title} saved to favorites', Colors.green);
        }
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Error saving recipe: ${e.toString()}');
      }
    }
  }

  void _showSuccessSnackBar(String message, Color color) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: color,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> fetchRecipe() async {
    try {
      await cubit.fetchRecipe();
      await _loadSavedRecipes();
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Error fetching recipes: ${e.toString()}');
      }
    }
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
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Loading recipes...'),
              ],
            ),
          );
        }

        if (state is RecipeError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error loading recipes',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please try again',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: fetchRecipe,
                  child: Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (state is RecipeLoaded) {
          final recipes = cubit.recipeData;

          if (recipes.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No recipes found',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Try refreshing or check your connection',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: fetchRecipe,
                    child: Text('Refresh'),
                  ),
                ],
              ),
            );
          }

          return SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: recipes.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                final isSaved = savedRecipeIds.contains(recipe.id);
                return GestureDetector(
                  onTap: () {
                    cubit.singleRecipeData = recipe;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: cubit,
                          child: RecipeDetails(),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 30 : 15),
                    child: _buildRecipeCard(
                        recipe, isSaved, () => _toggleSave(recipe, index)),
                  ),
                );
              },
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget _buildRecipeCard(
      RecipeModel recipe, bool isSaved, VoidCallback onToggle) {
    final isSaved = savedRecipeIds.contains(recipe.id);

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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          recipe.category,
                          style: GoogleFonts.poppins(
                              color: AppColors.cheifColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset(AppImages.flameIcon),
                      const SizedBox(width: 2),
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
                      GestureDetector(
                        onTap: isLoadingSaved ? null : onToggle,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          child: SvgPicture.asset(
                            AppImages.saveselected,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              isSaved ? Colors.red : Colors.grey[400]!,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
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
                ? Image.network(
                    recipe.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.grey[600],
                          size: 40,
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.restaurant,
                      color: Colors.grey[600],
                      size: 40,
                    ),
                  ),
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
              SvgPicture.asset('assets/icons/rate_star.svg'),
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
