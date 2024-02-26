import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //AuthService authService = Get.find();
  //ApiService apiService = Get.find();

  var nickController = TextEditingController();

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
      Get.offNamed(Routes.ROOMS);
    }
  }

// void tryLogin(String email, String password) =>
//     authService.login(email, password);

  void showSnack(String message, {isError = true}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 2),
    ));
  }
}
