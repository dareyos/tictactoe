import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/data/models/session/session.dart';
import 'package:tictactoe/app/data/services/network_service.dart';
import 'package:tictactoe/app/routes/app_pages.dart';

class RoomsController extends GetxController {
  var sessionNameController = TextEditingController();
  var netService = Get.find<NetService>();
  RxList<Session> sessions = <Session>[].obs;
  @override
  void onReady() {
    super.onReady();
  }

  void getSessions() async {
    sessions.value = await netService.getSessions();
    print(sessions);
    print("GET S");
  }

  void createSession() async {
    // bool latinChar(String text) {
    //   String validChar = r'^[a-zA-Z ]*$';
    //   RegExp regExp = RegExp(validChar);
    //   return regExp.hasMatch(text);
    // }

    // if (!latinChar(sessionNameController.text)) {
    //   showSnack("Имя игры должно быть написано на латинице");
    //   return;
    // }
    var successCreateGame = await netService.writeSession(sessionNameController.text);
    print(successCreateGame);
    if(successCreateGame){
      Get.offNamed(Routes.GAME);
    }else{
      showSnack('Ошибка');
    }

  }
    void showSnack(String message, {isError = true}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 2),
    ));
  }

  void goToLogin() {
    Get.offNamed(Routes.LOGIN);
  }
}
