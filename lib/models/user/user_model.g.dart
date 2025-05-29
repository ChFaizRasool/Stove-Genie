// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      number: json['number'] as String? ?? "",
      city: json['city'] as String? ?? "",
      licenseId: json['licenseId'] as String? ?? "",
      service: json['service'] as String? ?? "",
      image: json['image'] as String? ?? "",
      notifications: json['notifications'] as bool? ?? false,
      pushToken: json['pushToken'] as String? ?? "",
      state: json['state'] as String? ?? "",
      online: json['online'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      experience: (json['experience'] as num?)?.toDouble() ?? 0.0,
      orderCompleted: (json['orderCompleted'] as num?)?.toInt() ?? 0,
      bio: json['bio'] as String? ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'number': instance.number,
      'city': instance.city,
      'licenseId': instance.licenseId,
      'service': instance.service,
      'image': instance.image,
      'notifications': instance.notifications,
      'pushToken': instance.pushToken,
      'state': instance.state,
      'online': instance.online,
      'createdAt': instance.createdAt,
      'price': instance.price,
      'experience': instance.experience,
      'orderCompleted': instance.orderCompleted,
      'bio': instance.bio,
      'rating': instance.rating,
      'skills': instance.skills,
    };
