// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get licenseId => throw _privateConstructorUsedError;
  String get service => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  bool get notifications => throw _privateConstructorUsedError;
  String get pushToken => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  bool get online => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get experience => throw _privateConstructorUsedError;
  int get orderCompleted => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String number,
      String city,
      String licenseId,
      String service,
      String image,
      bool notifications,
      String pushToken,
      String state,
      bool online,
      String createdAt,
      double price,
      double experience,
      int orderCompleted,
      String bio,
      double rating,
      List<String> skills});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? number = null,
    Object? city = null,
    Object? licenseId = null,
    Object? service = null,
    Object? image = null,
    Object? notifications = null,
    Object? pushToken = null,
    Object? state = null,
    Object? online = null,
    Object? createdAt = null,
    Object? price = null,
    Object? experience = null,
    Object? orderCompleted = null,
    Object? bio = null,
    Object? rating = null,
    Object? skills = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      licenseId: null == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushToken: null == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      online: null == online
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as double,
      orderCompleted: null == orderCompleted
          ? _value.orderCompleted
          : orderCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String number,
      String city,
      String licenseId,
      String service,
      String image,
      bool notifications,
      String pushToken,
      String state,
      bool online,
      String createdAt,
      double price,
      double experience,
      int orderCompleted,
      String bio,
      double rating,
      List<String> skills});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? number = null,
    Object? city = null,
    Object? licenseId = null,
    Object? service = null,
    Object? image = null,
    Object? notifications = null,
    Object? pushToken = null,
    Object? state = null,
    Object? online = null,
    Object? createdAt = null,
    Object? price = null,
    Object? experience = null,
    Object? orderCompleted = null,
    Object? bio = null,
    Object? rating = null,
    Object? skills = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      licenseId: null == licenseId
          ? _value.licenseId
          : licenseId // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushToken: null == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      online: null == online
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as double,
      orderCompleted: null == orderCompleted
          ? _value.orderCompleted
          : orderCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.id = "",
      this.name = "",
      this.email = "",
      this.number = "",
      this.city = "",
      this.licenseId = "",
      this.service = "",
      this.image = "",
      this.notifications = false,
      this.pushToken = "",
      this.state = "",
      this.online = false,
      this.createdAt = "",
      this.price = 0.0,
      this.experience = 0.0,
      this.orderCompleted = 0,
      this.bio = "",
      this.rating = 0.0,
      final List<String> skills = const []})
      : _skills = skills;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String number;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String licenseId;
  @override
  @JsonKey()
  final String service;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final bool notifications;
  @override
  @JsonKey()
  final String pushToken;
  @override
  @JsonKey()
  final String state;
  @override
  @JsonKey()
  final bool online;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final double experience;
  @override
  @JsonKey()
  final int orderCompleted;
  @override
  @JsonKey()
  final String bio;
  @override
  @JsonKey()
  final double rating;
  final List<String> _skills;
  @override
  @JsonKey()
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, number: $number, city: $city, licenseId: $licenseId, service: $service, image: $image, notifications: $notifications, pushToken: $pushToken, state: $state, online: $online, createdAt: $createdAt, price: $price, experience: $experience, orderCompleted: $orderCompleted, bio: $bio, rating: $rating, skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.licenseId, licenseId) ||
                other.licenseId == licenseId) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            (identical(other.pushToken, pushToken) ||
                other.pushToken == pushToken) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.orderCompleted, orderCompleted) ||
                other.orderCompleted == orderCompleted) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        email,
        number,
        city,
        licenseId,
        service,
        image,
        notifications,
        pushToken,
        state,
        online,
        createdAt,
        price,
        experience,
        orderCompleted,
        bio,
        rating,
        const DeepCollectionEquality().hash(_skills)
      ]);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String id,
      final String name,
      final String email,
      final String number,
      final String city,
      final String licenseId,
      final String service,
      final String image,
      final bool notifications,
      final String pushToken,
      final String state,
      final bool online,
      final String createdAt,
      final double price,
      final double experience,
      final int orderCompleted,
      final String bio,
      final double rating,
      final List<String> skills}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get number;
  @override
  String get city;
  @override
  String get licenseId;
  @override
  String get service;
  @override
  String get image;
  @override
  bool get notifications;
  @override
  String get pushToken;
  @override
  String get state;
  @override
  bool get online;
  @override
  String get createdAt;
  @override
  double get price;
  @override
  double get experience;
  @override
  int get orderCompleted;
  @override
  String get bio;
  @override
  double get rating;
  @override
  List<String> get skills;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
