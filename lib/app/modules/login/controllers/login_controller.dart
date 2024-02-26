import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/routes/app_pages.dart';
import 'package:tictactoe/core/constants.dart';
import 'package:tictactoe/models/user_get/user_get.dart';
import 'package:tictactoe/services/auth_service.dart';
import 'package:tictactoe/services/storage_service.dart';

class LoginController extends GetxController {
  AuthService authService = Get.find();
  Dio client = Dio(BaseOptions(baseUrl: Constants.baseUrl));
  StorageService storageService = Get.find();

  var nickController = TextEditingController();

  late UserGet userGet;

  void login() async {
    bool latinChar(String text) {
      String validChar = r'^[a-zA-Z ]*$';
      RegExp regExp = RegExp(validChar);
      return regExp.hasMatch(text);
    }

    if (nickController.text.isEmpty) {
      showSnack("Введите имя пользователя!");
      return;
    } else if (!latinChar(nickController.text)) {
      showSnack("Имя пользователя должно быть на английском языке.");
      return;
    } else {
      var response = await client.post('/user/add/${nickController.text}');
      if (response.statusCode == 200) {
        userGet = UserGet.fromJson(response.data);
      }
      storageService.write("user", userGet);
      authService.getBasicAuth(userGet);
      Get.offNamed(Routes.ROOMS);
    }
  }

  void showSnack(String message, {isError = true}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 2),
    ));
  }
}
