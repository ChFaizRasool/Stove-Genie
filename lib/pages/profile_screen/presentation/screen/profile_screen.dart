import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';
import 'package:stove_genie/core/di_container.dart';
import 'package:stove_genie/localdb/recipe_db.dart';
import 'package:stove_genie/models/recipe/recipe_model.dart';
import 'package:stove_genie/pages/profile_screen/presentation/widget/my_receipe_widget.dart';
import 'package:stove_genie/pages/profile_screen/presentation/widget/profile_row.dart';
import 'package:stove_genie/utils/helper.dart';
import 'package:stove_genie/pages/saved_recipes/presentation/widget/recipe_container.dart';
import 'package:stove_genie/utils/images.dart';
import 'package:stove_genie/widget/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = Di().sl<AuthCubit>().user;
  List<RecipeModel> savedRecipes = [];

  Future<void> loadSavedRecipes() async {
    final recipes = await RecipeDbHelper().getRecipes();
    setState(() {
      savedRecipes = recipes;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSavedRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              profileRow(context),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(user.name.isNotEmpty ? user.name : 'Guest',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: const Color(0xff121212))),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text('Chef',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: const Color(0xffa9a9a9))),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                    user.bio.isNotEmpty
                        ? user.bio
                        : 'Passionate about food and life',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: const Color(0xff797979))),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: getWidth(context) * 0.9,
                child: Center(
                  child: Text('My Recipes',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: const Color(0xff121212))),
                ),
              ),
              const SizedBox(height: 20),
              MyReceipeWidget(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 140, horizontal: 60),
        child: CustomButton(
          text: 'Logout',
          onTap: () {
            Di().sl<AuthCubit>().logout(context);
          },
        ),
      ),
    );
  }
}
