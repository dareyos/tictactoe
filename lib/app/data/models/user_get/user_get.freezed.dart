// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_get.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserGet _$UserGetFromJson(Map<String, dynamic> json) {
  return _UserGet.fromJson(json);
}

/// @nodoc
mixin _$UserGet {
  String get private_key => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserGetCopyWith<UserGet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGetCopyWith<$Res> {
  factory $UserGetCopyWith(UserGet value, $Res Function(UserGet) then) =
      _$UserGetCopyWithImpl<$Res, UserGet>;
  @useResult
  $Res call({String private_key, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserGetCopyWithImpl<$Res, $Val extends UserGet>
    implements $UserGetCopyWith<$Res> {
  _$UserGetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private_key = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      private_key: null == private_key
          ? _value.private_key
          : private_key // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserGetImplCopyWith<$Res> implements $UserGetCopyWith<$Res> {
  factory _$$UserGetImplCopyWith(
          _$UserGetImpl value, $Res Function(_$UserGetImpl) then) =
      __$$UserGetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String private_key, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserGetImplCopyWithImpl<$Res>
    extends _$UserGetCopyWithImpl<$Res, _$UserGetImpl>
    implements _$$UserGetImplCopyWith<$Res> {
  __$$UserGetImplCopyWithImpl(
      _$UserGetImpl _value, $Res Function(_$UserGetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? private_key = null,
    Object? user = null,
  }) {
    return _then(_$UserGetImpl(
      private_key: null == private_key
          ? _value.private_key
          : private_key // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserGetImpl extends _UserGet {
  _$UserGetImpl({required this.private_key, required this.user}) : super._();

  factory _$UserGetImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGetImplFromJson(json);

  @override
  final String private_key;
  @override
  final User user;

  @override
  String toString() {
    return 'UserGet(private_key: $private_key, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGetImpl &&
            (identical(other.private_key, private_key) ||
                other.private_key == private_key) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, private_key, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGetImplCopyWith<_$UserGetImpl> get copyWith =>
      __$$UserGetImplCopyWithImpl<_$UserGetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGetImplToJson(
      this,
    );
  }
}

abstract class _UserGet extends UserGet {
  factory _UserGet(
      {required final String private_key,
      required final User user}) = _$UserGetImpl;
  _UserGet._() : super._();

  factory _UserGet.fromJson(Map<String, dynamic> json) = _$UserGetImpl.fromJson;

  @override
  String get private_key;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$UserGetImplCopyWith<_$UserGetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
