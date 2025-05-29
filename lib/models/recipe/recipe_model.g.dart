// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeModelImpl _$$RecipeModelImplFromJson(Map<String, dynamic> json) =>
    _$RecipeModelImpl(
      id: json['id'] as String? ?? "",
      title: json['title'] as String? ?? "",
      image: json['image'] as String? ?? "",
      time: json['time'] as String? ?? "",
      calories: json['calories'] as String? ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      backgroundColor: json['backgroundColor'] as String? ?? "",
    );

Map<String, dynamic> _$$RecipeModelImplToJson(_$RecipeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'time': instance.time,
      'calories': instance.calories,
      'rating': instance.rating,
      'backgroundColor': instance.backgroundColor,
    };
