import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/modules/game/game_controller.dart';

class GameView extends GetView<GameController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    double minSide = min(context.height, context.width);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'PLAYER 1 vs PLAYER 2',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () => controller.goBack(),
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildHeader(),
              _buildField(minSide),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(double minSide) {
    return SizedBox(
      height: minSide * 0.85,
      width: minSide * 0.85,
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return Obx(
              () => GestureDetector(
                onTap: () => controller.makeMove(index),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      controller.boardCells[index],
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      ),
    );
  }

  SizedBox _buildHeader() {
    return SizedBox(
      height: 100,
      child: Center(
        child: Obx(
          () => Text(
            "Turn ${controller.turnOf}",
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
