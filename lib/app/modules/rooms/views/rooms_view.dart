import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tictactoe/app/modules/rooms/views/add_game_dialog.dart';
import 'package:tictactoe/utils/colors.dart';

import '../controllers/rooms_controller.dart';

class RoomsView extends GetView<RoomsController> {
  const RoomsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: const Text(
          'TicTacToe',
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => openAddTaskDialog(context),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: AppColors.accentColor),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   void openAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddGameAlertDialog();
      },
    );
  }

}
