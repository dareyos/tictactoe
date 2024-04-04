import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  final _boardCells = List.filled(9, "").obs;
  final _turnOf = "X".obs;

  List<String> get boardCells => _boardCells;
  String get turnOf => _turnOf.value;

  void makeMove(int pos) {
    if (_boardCells[pos] != "") return;
    _boardCells[pos] = _turnOf.value;
    checkWinner();
    changeTurn();
  }

  void checkWinner() {
    List<List<int>> winningConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];

    for (var condition in winningConditions) {
      if (_boardCells[condition[0]] != "" &&
          _boardCells[condition[0]] == _boardCells[condition[1]] &&
          _boardCells[condition[1]] == _boardCells[condition[2]]) {
        showSnack("Победитель: ${_boardCells[condition[0]]}");
        _boardCells.value = List.filled(9, "");
        return;
      }
    }

    if (!_boardCells.contains("")) {
      showSnack("Ничья");
      _boardCells.value = List.filled(9, "");
    }
  }

  void changeTurn() {
    _turnOf.value = _turnOf.value == "X" ? "O" : "X";
  }

  void showSnack(String message, {isError = true}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: const Color.fromARGB(255, 76, 86, 175),
      duration: const Duration(seconds: 2),
    ));
  }

  Future<void> goBack() async {
    Get.back();
  }
}
