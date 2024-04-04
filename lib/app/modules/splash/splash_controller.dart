import 'package:get/get.dart';
import 'package:tictactoe/app/data/services/network_service.dart';
import 'package:tictactoe/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final _netService = Get.find<NetService>();

  @override
  void onReady() async {
    super.onReady();
    checkLogIn();
  }

  Future<void> checkLogIn() async {
    bool isLoggedIns = await _netService.isLoggedIn();
    if (isLoggedIns) {
      Get.offNamed(Routes.ROOMS);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
