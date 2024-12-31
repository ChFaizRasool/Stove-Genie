import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/profile_screen/presentation/widget/profile_row.dart';
import 'package:stove_genie/pages/saved_recipes/presentation/widget/recipe_container.dart';
import 'package:stove_genie/utils/helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        primary: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              profileRow(context),
              SizedBox(
                height: 25,
              ),
              Text('Sir Faiz',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xff121212))),
              Text('Chef',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: Color(0xffa9a9a9))),
              SizedBox(
                height: 10,
              ),
              Text('Passionate about food and life',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: Color(0xff797979))),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: getWidth(context) * 0.9,
                child: Center(
                  child: Text('My Recipies',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0xff121212))),
                ),
              ),
              SizedBox(height: 20,),
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
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
