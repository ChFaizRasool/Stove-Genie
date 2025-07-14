import 'dart:developer';

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
      setState(() {});
    } catch (e) {
      _showErrorSnackBar('Error fetching recipes: ${e.toString()}');
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
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RecipeError) {
          return Center(child: Text('Failed to load recipes.'));
        }

        if (state is RecipeLoaded) {
          final recipes = cubit.recipeData.reversed.toList();

          if (recipes.isEmpty) {
            return Center(child: Text('No recipes found.'));
          }

          return SizedBox(
              height: 250,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return ListView.builder(
                    itemCount: recipes.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return FutureBuilder<bool>(
                        future: RecipeDbHelper().isRecipeSaved(recipe.id),
                        builder: (context, snapshot) {
                          final isSaved = snapshot.data ?? false;
                          return Padding(
                            padding:
                                EdgeInsets.only(left: index == 0 ? 30 : 15),
                            child: RecepieWidget(
                              recipe: recipe,
                              isFavorite: isSaved,
                              onFavoriteToggled: () =>
                                  setState(() {}), // rebuild list
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ));
        }

        return Container();
      },
    );
  }
}

class RecepieWidget extends StatefulWidget {
  final RecipeModel recipe;
  final bool isFavorite;
  final VoidCallback onFavoriteToggled;
  const RecepieWidget(
      {super.key,
      required this.recipe,
      required this.isFavorite,
      required this.onFavoriteToggled});

  @override
  State<RecepieWidget> createState() => _RecepieWidgetState();
}

class _RecepieWidgetState extends State<RecepieWidget> {
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

  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = widget.isFavorite;
  }

  Future<void> _toggleFavorite() async {
    if (isFav) {
      await RecipeDbHelper().deleteRecipe(widget.recipe.id);
    } else {
      await RecipeDbHelper().insertRecipe(widget.recipe);
    }
    setState(() => isFav = !isFav);
    widget.onFavoriteToggled();
  }

  @override
  Widget build(BuildContext context) {
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
                      widget.recipe.title,
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
                          widget.recipe.category,
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
                        '${widget.recipe.calories} KCal',
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
                        '${widget.recipe.time} Mins',
                        style: GoogleFonts.poppins(
                            color: AppColors.resipetextColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: _toggleFavorite,
                        child: SvgPicture.asset(
                          isFav
                              ? AppImages.saveselected
                              : AppImages.saveUnSelected,
                          height: 20,
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
            child: widget.recipe.image.isNotEmpty
                ? Image.network(
                    widget.recipe.image,
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
                widget.recipe.rating.toStringAsFixed(1),
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
