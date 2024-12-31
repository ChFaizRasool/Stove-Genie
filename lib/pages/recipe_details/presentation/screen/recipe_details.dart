import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/ingredients.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/procedure.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/rate_recipe.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/recipe_dialog.dart';
import 'package:stove_genie/pages/recipe_details/presentation/widget/user_account.dart';
import 'package:stove_genie/pages/reviews_screen/presentation/screen/reviews_screen.dart';
import 'package:stove_genie/pages/saved_recipes/presentation/widget/recipe_container.dart';
import 'package:stove_genie/utils/helper.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          primary: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          actions: [
            PopupMenuButton<int>(
              icon: Icon(
                Icons.more_horiz_outlined,
                color: Colors.black,
              ),
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
                    showRateRecipeDialog(context);
                    break;
                  case 2:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReviewsScreen()));
                    break;
                  case 3:
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(Icons.share, color: Colors.black),
                      SizedBox(width: 10),
                      Text('Share'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.black),
                      SizedBox(width: 10),
                      Text('Rate Recipe'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.comment, color: Colors.black),
                      SizedBox(width: 10),
                      Text('Review'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: [
                      Icon(Icons.bookmark, color: Colors.black),
                      SizedBox(width: 10),
                      Text('Unsave'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Column(
                spacing: 10,
                children: [
                  RecipeContainer(
                    imgPath: 'assets/images/containerImg1.png',
                    rating: '4.0',
                    time: '20 min',
                    showButton: true,
                  ),
                  SizedBox(
                    width: getWidth(context) * 0.9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: getWidth(context) * 0.5,
                            child: Text(
                              'Spicy chicken burger with French fries',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black),
                            )),
                        Spacer(),
                        Text('(13k Reviews)',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xffa3a3a3)))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              userAccount(context, 'assets/images/profile.png', 'Laura wilson',
                  'Lagos, Nigeria'),
              SizedBox(height: 20),
              TabBar(
                physics: NeverScrollableScrollPhysics(),
                isScrollable: false,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: Color(0xFFFFA307),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Color(0xFFFFA307),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: [
                  Tab(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('INGREDIENT'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('PROCEDURE'),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Ingredients(),
                    Procedure(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
