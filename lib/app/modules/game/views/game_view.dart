import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/modules/game/controllers/game_controller.dart';
import 'package:tictactoe/app/modules/game/views/xofield_view.dart';


class GameView extends GetView<GameController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PLAYER 1 vs PLAYER 2',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: Center(
                    child: Obx(() => Text(
                          controller.gameText.value,
                          style: const TextStyle(fontSize: 40),
                        )))),
            Center(
              child: SizedBox(
                height: Get.width * .8,
                width: Get.width * .8,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(() => XOFieldView(
                          index,
                          controller.playerMove.value,
                          () => controller.changePlayerMove(),
                          controller.fields[index],
                        ));
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ),
            ),
            const Flexible(child: Center())
          ],
        ),
      ),
    );
  }
}