import 'package:get/get.dart';
import 'package:tictactoe/app/data/services/network_service.dart';

import 'rooms_controller.dart';

class RoomsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetService>(
      () => NetService(),
    );
    Get.lazyPut<RoomsController>(
      () => RoomsController(),
    );
  }
}
