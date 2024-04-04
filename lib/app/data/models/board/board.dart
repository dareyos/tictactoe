import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@freezed
class Board with _$Board {

  factory Board({
    required List<String> row0,
    required List<String> row1,
    required List<String> row2,
    required String turn,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
}