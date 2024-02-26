// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_get.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserGetImpl _$$UserGetImplFromJson(Map<String, dynamic> json) =>
    _$UserGetImpl(
      private_key: json['private_key'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserGetImplToJson(_$UserGetImpl instance) =>
    <String, dynamic>{
      'private_key': instance.private_key,
      'user': instance.user,
    };
