import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/modules/game/game_controller.dart';

class GameView extends GetView<GameController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: Center(
                    child: Obx(() => Text(
                          "Turn ${controller.session.value.board.turn}",
                          style: const TextStyle(fontSize: 40),
                        )))),
            Flexible(
              flex: 9,
              child: Center(
                child: SizedBox(
                  height: Get.width * .8,
                  width: Get.width * .8,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      int row = index ~/ 3;
                      int col = index % 3;
                      return Obx(() => GestureDetector(
                            onTap: () => controller.makeMove(row, col),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Get.theme.primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  controller.marks[index],
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
