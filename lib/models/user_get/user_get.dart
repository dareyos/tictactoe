import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/models/user/user.dart';

part 'user_get.freezed.dart';
part 'user_get.g.dart';

@freezed
class UserGet with _$UserGet {
  factory UserGet({
    required String private_key,
    required User user,
  }) = _UserGet;

  factory UserGet.fromJson(Map<String, dynamic> json) =>
      _$UserGetFromJson(json);
}
