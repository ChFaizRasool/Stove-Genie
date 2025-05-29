// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dartz/dartz.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:stove_genie/models/recipe/recipe_model.dart';

// abstract class RecipeApi {
//   Future<Either<String, RecipeModel>> addRecipe({RecipeModel? recipeData});
// }

// class RecipeApiImpl extends RecipeApi {
//   @override
//   Future<Either<String, RecipeModel>> addRecipe(
//       {RecipeModel? recipeData}) async {
//     await FirebaseFirestore.instance.collection('recipes').doc().set({
//       'recipeId': recipeData?.id,
//       'title': recipeData?.title,
//       // 'description': recipeData?.,
//       'image': recipeData?.image,
//       'time': recipeData?.time,
//       'calories': recipeData?.calories,
//       'rating': recipeData?.rating,
//       'createdAt': DateTime.now().toIso8601String(),
//     });
//   }
// }
