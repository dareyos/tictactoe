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

//   class _TicTacToePageState extends State<TicTacToePage> {
//   bool isTurn = true;
//   int oScore = 0;
//   int xScore = 0;
//   int count = 0;

//   List<String> changeXO = [
//     '', '', '', '', '', '', '', '', '',
//   ];


//    void _setXor0(int index) {
//     if (isTurn && changeXO[index] == '') {
//       setState(() {
//         changeXO[index] = 'o';
//         isTurn = !isTurn;
//       });
//     } else if (!isTurn && changeXO[index] == '') {
//       setState(() {
//         changeXO[index] = 'x';
//         isTurn = !isTurn;
//       });
//     }

//     count++;
//     _checkWinner();
//   }

//   void _checkWinner() {
//     if (changeXO[0] == changeXO[1] &&
//         changeXO[0] == changeXO[2] &&
//         changeXO[0] != '') {
//       _showDialog(winner : changeXO[0]);
//     }
//     if (changeXO[3] == changeXO[4] &&
//         changeXO[3] == changeXO[5] &&
//         changeXO[3] != '') {
//       _showDialog(winner : changeXO[3]);
//     }
//     if (changeXO[6] == changeXO[7] &&
//         changeXO[6] == changeXO[8] &&
//         changeXO[6] != '') {
//       _showDialog(winner : changeXO[6]);
//     }
//     if (changeXO[0] == changeXO[3] &&
//         changeXO[0] == changeXO[6] &&
//         changeXO[0] != '') {
//       _showDialog(winner : changeXO[0]);
//     }
//     if (changeXO[1] == changeXO[4] &&
//         changeXO[1] == changeXO[7] &&
//         changeXO[1] != '') {
//       _showDialog(winner : changeXO[1]);
//     }
//     if (changeXO[2] == changeXO[5] &&
//         changeXO[2] == changeXO[8] &&
//         changeXO[2] != '') {
//       _showDialog(winner : changeXO[2]);
//     }
//     if (changeXO[0] == changeXO[4] &&
//         changeXO[0] == changeXO[8] &&
//         changeXO[0] != '') {
//       _showDialog(winner : changeXO[0]);
//     }
//     if (changeXO[2] == changeXO[4] &&
//         changeXO[2] == changeXO[6] &&
//         changeXO[2] != '') {
//       _showDialog(winner : changeXO[2]);
//     }

//     if (count == 9) {
//       _showDialog(winnerExist: false);
//       _clearBoard();
//     }
//   }


//   void _showDialog({String winner = '', bool winnerExist = true}) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(winnerExist ? 'Winner: $winner' : 'No winner, you\'re dumbass '),
//             actions: [
//               TextButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   child: const Text('Another game?'))
//             ],
//           );
//         });

//     count = 0;
//     _clearBoard();
//     if (winner == 'o') {
//       setState(() {
//         oScore++;
//       });
//     } else if (winner == 'x') {
//       xScore++;
//     }
//   }

//   void _clearBoard() {
//     for (int i = 0; i < 9; i++) {
//       changeXO[i] = '';
//     }
//   }
// }

}
