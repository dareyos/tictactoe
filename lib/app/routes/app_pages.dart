import 'package:get/get.dart';

import '../modules/game/game_binding.dart';
import '../modules/game/game_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/rooms/rooms_binding.dart';
import '../modules/rooms/rooms_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.GAME,
      page: () => const GameView(),
      binding: GameBinding(),
    ),
    GetPage(
      name: _Paths.ROOMS,
      page: () => const RoomsView(),
      binding: RoomsBinding(),
    ),
  ];
}
