// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      board: Board.fromJson(json['board'] as Map<String, dynamic>),
      game_state: json['game_state'] as String,
      host_name: json['host_name'] as String,
      guest_name: json['guest_name'] as String?,
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'board': instance.board,
      'game_state': instance.game_state,
      'host_name': instance.host_name,
      'guest_name': instance.guest_name,
      'id': instance.id,
      'name': instance.name,
    };
