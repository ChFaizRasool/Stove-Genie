import 'package:freezed_annotation/freezed_annotation.dart';

part "user_model.freezed.dart";
part "user_model.g.dart";

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default("") String id,
    @Default("") String name,
    @Default("") String email,
    @Default("") String number,
    @Default("") String city,
    @Default("") String licenseId,
    @Default("") String service,
    @Default("") String image,
    @Default(false) bool notifications,
    @Default("") String pushToken,
    @Default("") String state,
    @Default(false) bool online,
    @Default("") String createdAt,
    @Default(0.0) double price,
    @Default(0.0) double experience,
    @Default(0) int orderCompleted,
    @Default("") String bio,
    @Default(0.0) double rating,
    @Default([]) List<String> skills,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
