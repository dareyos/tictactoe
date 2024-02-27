import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/data/models/user_get/user_get.dart';
import 'package:tictactoe/app/data/services/network_service.dart';
import 'package:tictactoe/app/data/services/storage_service.dart';
import 'package:tictactoe/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var netService = Get.find<NetService>();
  var nickController = TextEditingController();
  var storageService = Get.find<StorageService>();

  late UserGet userGet;

  void login() async {
    bool latinChar(String text) {
      String validChar = r'^[a-zA-Z ]*$';
      RegExp regExp = RegExp(validChar);
      return regExp.hasMatch(text);
    }

    var successRegistration =
        await netService.registration(nickController.text);
    print(successRegistration);

    if (nickController.text.isEmpty) {
      showSnack("Введите имя пользователя!");
      return;
    } else if (!latinChar(nickController.text)) {
      showSnack("Имя пользователя должно быть на английском языке.");
      return;
    } else if (successRegistration) {
      Get.offNamed(Routes.ROOMS);
    } else {
      showSnack('Пользователь уже существует');
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
