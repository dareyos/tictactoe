import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/data/models/session/session.dart';
import 'package:tictactoe/app/data/services/network_service.dart';
import 'package:tictactoe/app/routes/app_pages.dart';

class RoomsController extends GetxController {
  var sessionNameController = TextEditingController();
  var netService = Get.find<NetService>();
  RxList<Session> sessions = <Session>[].obs;
  final _userNick = "Loading".obs;

  String get userNick => _userNick.value;

  @override
  void onReady() {
    super.onReady();
    getNick();
  }

  Future<void> getNick() async {
    _userNick.value = await netService.getUserNick() ?? "???";
  }

  void getSessions() async {
    sessions.value = await netService.getSessions();
  }

  Future<void> joinToRoom(Session session) async {
    // Session? updatedSession = await netService.joinSession(session.id);
    // if (updatedSession == null) {
    //   showSnack("Сессия занята");
    //   return;
    // }
    // Session? startedSession =  await netService.startSession();
    // if (startedSession == null) {
    //   showSnack("Не удалось запустить сессию");
    //   return;
    // }
    // Get.toNamed(Routes.GAME, arguments: updatedSession);
    showSnack("Не функционирует");
  }

  void createSession() async {
    // var successCreateGame =
    //     await netService.writeSession(sessionNameController.text);
    // if (successCreateGame != null) {
      Get.toNamed(Routes.GAME);
    // } else {
    //   showSnack('Ошибка');
    // }
  }

  void showSnack(String message, {isError = true}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 2),
    ));
  }

  void logOut() {
    netService.logOut();
    Get.offNamed(Routes.LOGIN);
  }
}
