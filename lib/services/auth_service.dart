import 'dart:convert';

import 'package:get/get.dart';
import 'package:tictactoe/models/user_get/user_get.dart';
import 'package:tictactoe/services/storage_service.dart';

class AuthService extends GetxService {
  StorageService storageService = StorageService();

  void getBasicAuth(UserGet user) {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('${user.user.username}:${user.private_key}'))}';
    storageService.writeBasicAuth("basicAuth", basicAuth);
  }
}
