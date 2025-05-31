import 'package:freezed_annotation/freezed_annotation.dart';
part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  factory RecipeModel({
    @Default("") String id,
    @Default("") String title,
    @Default("") String image,
    @Default("") String time,
    @Default("") String calories,
    @Default(0.0) double rating,
    @Default("") String backgroundColor,
    @Default("") String description,
    @Default("") String category,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}
