import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/data/models/session/session.dart';
import 'package:tictactoe/app/data/services/network_service.dart';

class GameController extends GetxController {
  final _netService = Get.find<NetService>();

  final Rx<Session> session = (Get.arguments as Session).obs;

  late Timer runningTimer;

  List<String> get marks =>
      session.value.board.row0 +
      session.value.board.row1 +
      session.value.board.row2;

  @override
  void onInit() {
    // initFields();
    super.onInit();
    runningTimer = Timer.periodic(
        const Duration(seconds: 3), (timer) => updateGameState());
  }

  Future<void> updateGameState() async {
    session.value = await _netService.getSession(session.value.id);
    print(session.value);
  }

  Future<void> makeMove(int row, int col) async {
    Session? updatedSession = await _netService.doMove(row, col);
    if (updatedSession == null) {
      showSnack("Невозможно сходить");
      return;
    }
    session.value = updatedSession;
  }

  void showSnack(String message, {isError = true}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 2),
    ));
  }

  Future<void> goBack() async {
    runningTimer.cancel();
    Get.back();
  }
}
