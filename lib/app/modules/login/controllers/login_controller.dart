import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/data/models/user_get/user_get.dart';
import 'package:tictactoe/app/data/services/network_service.dart';
import 'package:tictactoe/app/data/services/storage_service.dart';
import 'package:tictactoe/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var nickController = TextEditingController();
  final netService = Get.find<NetService>(); //сделать переменную приватной
  var storageService = Get.find<StorageService>();


  late UserGet userGet;

  void login() async {

    var successRegistration = await netService.registration(nickController.text);
    print(successRegistration);
    if(successRegistration){
      Get.offNamed(Routes.ROOMS);
    }else{
      showSnack('Пользователь уже существует или ошибка');
    }
  }

  
 void showSnack(String message, {isError = true}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 2),
    ));
  }

  // void onReady() {
  //   super.onReady();
  //   Get.offNamed(Routes.ROOMS_PAGE);
  // }
}