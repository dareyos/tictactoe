import 'package:get/get.dart';
import 'package:tictactoe/app/data/services/network_service.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetService>(
      () => NetService(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
