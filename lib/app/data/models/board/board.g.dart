// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardImpl _$$BoardImplFromJson(Map<String, dynamic> json) => _$BoardImpl(
      row0: (json['row0'] as List<dynamic>).map((e) => e as String).toList(),
      row1: (json['row1'] as List<dynamic>).map((e) => e as String).toList(),
      row2: (json['row2'] as List<dynamic>).map((e) => e as String).toList(),
      turn: json['turn'] as String,
    );

Map<String, dynamic> _$$BoardImplToJson(_$BoardImpl instance) =>
    <String, dynamic>{
      'row0': instance.row0,
      'row1': instance.row1,
      'row2': instance.row2,
      'turn': instance.turn,
    };
