import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/app/data/models/board/board.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {

  factory Session({
    required Board board,
    required String game_state,
    required String host_name,
    required String? guest_name,
    required String id,
    required String name,
}) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
}