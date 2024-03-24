import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/data/models/session/session.dart';
import 'package:tictactoe/app/data/services/network_service.dart';
import 'package:tictactoe/app/modules/game/xofield_controller.dart';
import 'package:tictactoe/app/modules/game/xofield_view.dart';

class GameController extends GetxController {
  final _netService = Get.find<NetService>();

  // final playerMove = XOState.x.obs;
  // final playerSide = XOState.x.obs;
  // final gameIsEnd = false.obs;
  // final count = 0.obs;
  // late RxList<XOFieldController> fields;
  // final gameText = 'Ход Х'.obs;

  final Rx<Session> session = (Get.arguments as Session).obs;

  List<String> get marks =>
      session.value.board.row0 +
      session.value.board.row1 +
      session.value.board.row2;

  // void changePlayerMove() {
  //   gameIsEnd.value = checkGameEnd();
  //   if (gameIsEnd.value) return;
  //   //TODO
  //   playerMove.value = playerMove.value == XOState.x ? XOState.o : XOState.x;
  //   gameText.value = "Ход ${playerMove.value.str}";
  //   count.value++;
  // }

  @override
  void onInit() {
    // initFields();
    super.onInit();
    Timer.periodic(const Duration(seconds: 3), (timer) => updateGameState());
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

  // void initFields() {
  //   fields = List.generate(9, (index) {
  //     return Get.put(XOFieldController(num: index),
  //         tag: "$controllerTag$index");
  //   }).obs;
  // }

  // bool checkGameEnd() {
  //   if (count.value == 8) {
  //     gameIsEnd.value = true;
  //     gameText.value = "Закончились ходы";
  //     return true;
  //   }
  //   return false;
  // }
  Future<void> goBack() async => Get.back();
}
