import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
        actions: [
          IconButton(
              onPressed: () => controller.goToLogin(),
              icon: const Icon(
                Icons.exit_to_app,
                color: AppColors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () => controller.getSessions(),
                    child: const Text("Доступные комнаты")),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.sessions.length,
                  itemBuilder: (context, id) {
                    var curSession = controller.sessions[id];
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 1,
                        child: ListTile(
                          title: Text(
                            'Имя игры: ${curSession.name}',
                            style: const TextStyle(
                                color: AppColors.accentColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Имя хоста: ${curSession.host_name}',
                            style: const TextStyle(
                                color: AppColors.accentColor, fontSize: 16),
                          ),
                          trailing: Text(
                            'Статус: ${curSession.game_state}',
                            style: const TextStyle(
                                color: AppColors.accentColor, fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }

  void openAddTaskDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        title: const Text(
          'Создать игру',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: AppColors.white),
        ),
        content: SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: TextField(
            controller: controller.sessionNameController,
          ),
        ),
        actions: [
          ElevatedButton(
              child: const Text('Создать'),
              onPressed: () {
                controller.createSession();
              }),
        ],
      ),
    );
  }
}
