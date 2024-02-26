import 'package:get/get.dart';
import 'package:tictactoe/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    Get.toNamed(Routes.LOGIN);
  }

  // @override
  // void onReady() async {
  //   super.onReady();
  //   await authService.tryAuth();
  //   if (authService.isAuth) {
  //     Get.toNamed(Routes.HOME);
  //   } else {
  //     Get.toNamed(Routes.LOGIN);
  //   }
  // }
}
