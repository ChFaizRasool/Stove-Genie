import 'package:flutter/material.dart';
import 'package:stove_genie/pages/saved_recipes/presentation/widget/recipe_container.dart';

class SavedRecipesScreen extends StatelessWidget {
  const SavedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Saved recipes'),
        centerTitle: true,
        primary: true,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
                child: Column(
                  // spacing: 20,
                  children: [
                    RecipeContainer(
                      imgPath: 'assets/images/containerImg1.png',
                      rating: '4.0',
                      recipeName: 'Traditional spare ribs baked',
                      chefName: 'By Mark Kelvin',
                      kCal: '1081 KCal',
                      time: '20 min',
                    ),
                    RecipeContainer(
                      imgPath: 'assets/images/containerImg2.png',
                      rating: '4.0',
                      recipeName: 'spice roasted chicken with flavored rice',
                      chefName: 'By Mark Kelvin',
                      kCal: '1081 KCal',
                      time: '20 min',
                    ),
                    RecipeContainer(
                      imgPath: 'assets/images/containerImg3.png',
                      rating: '4.0',
                      recipeName: 'Spicy fried rice mix chicken bali',
                      chefName: 'By Spicy Nelly',
                      kCal: '1081 KCal',
                      time: '20 min',
                    ),
                    RecipeContainer(
                      imgPath: 'assets/images/containerImg4.png',
                      rating: '3.0',
                      recipeName: 'Lamb chops with fruity couscous and mint',
                      chefName: 'By Spicy Nelly',
                      kCal: '1081 KCal',
                      time: '20 min',
                    ),
                    RecipeContainer(
                      imgPath: 'assets/images/containerImg1.png',
                      rating: '4.0',
                      recipeName: 'Traditional spare ribs baked',
                      chefName: 'By Mark Kelvin',
                      kCal: '1081 KCal',
                      time: '20 min',
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
