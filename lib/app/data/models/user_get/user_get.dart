import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/app/data/models/user/user.dart';

part 'user_get.freezed.dart';
part 'user_get.g.dart';

@freezed
class UserGet with _$UserGet {
  UserGet._();
  factory UserGet({
    required String private_key,
    required User user,
  }) = _UserGet;

  String get key => 'Basic ${base64.encode(utf8.encode('${user.username}:$private_key'))}';

  factory UserGet.fromJson(Map<String, dynamic> json) =>
      _$UserGetFromJson(json);
}
