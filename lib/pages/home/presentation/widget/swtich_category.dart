import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stove_genie/bloc/cubit/recipe_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/pages/home/presentation/provider/category_provider.dart';
import 'package:stove_genie/pages/home/presentation/widget/all_screen.dart';
import 'package:stove_genie/pages/home/presentation/widget/category_button.dart';
import 'package:stove_genie/utils/colors.dart';

class CategorySwitich extends StatefulWidget {
  const CategorySwitich({super.key});

  @override
  State<CategorySwitich> createState() => _CategorySwitichState();
}

class _CategorySwitichState extends State<CategorySwitich> {
  int intialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _recipeCubit,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: intialIndex == 0 ? 30 : 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _recipeCubit.setCurrentIndex(0);
                    },
                    child: _recipeCubit.currentIndex == 0
                        ? const CategoryButton(
                            height: 31,
                            widget: 54,
                            text: 'All',
                          )
                        : Text(
                            'All',
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.buttonColor),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _recipeCubit.setCurrentIndex(1);
                    },
                    child: _recipeCubit.currentIndex == 1
                        ? const CategoryButton(
                            height: 31,
                            widget: 54,
                            text: 'Indian',
                          )
                        : Text(
                            'Indian',
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.buttonColor),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _recipeCubit.setCurrentIndex(2);
                    },
                    child: _recipeCubit.currentIndex == 2
                        ? const CategoryButton(
                            height: 31,
                            widget: 54,
                            text: 'Italian',
                          )
                        : Text(
                            'Italian',
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.buttonColor),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _recipeCubit.setCurrentIndex(3);
                    },
                    child: _recipeCubit.currentIndex == 3
                        ? const CategoryButton(
                            height: 31,
                            widget: 54,
                            text: 'Asian',
                          )
                        : Text(
                            'Asian',
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.buttonColor),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _recipeCubit.setCurrentIndex(4);
                    },
                    child: _recipeCubit.currentIndex == 4
                        ? const CategoryButton(
                            height: 31,
                            widget: 54,
                            text: 'Chinese',
                          )
                        : Text(
                            'Chinese',
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.buttonColor),
                          ),
                  ),
                ],
              ),
            ),
            // if (intialIndex == 0)

            SizedBox(
              height: 30,
            ),
            const AllScreen(),
          ],
        );
      },
    );
  }
}

final _recipeCubit = Di().sl<RecipeCubit>();
