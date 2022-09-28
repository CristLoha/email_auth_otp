import 'package:get/get.dart';

import 'package:flutter_firebase_crud/app/modules/beranda/bindings/beranda_binding.dart';
import 'package:flutter_firebase_crud/app/modules/beranda/views/beranda_view.dart';
import 'package:flutter_firebase_crud/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_firebase_crud/app/modules/home/views/home_view.dart';
import 'package:flutter_firebase_crud/app/modules/landing_screen/bindings/landing_screen_binding.dart';
import 'package:flutter_firebase_crud/app/modules/landing_screen/views/landing_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LANDING_SCREEN,
      page: () => LandingScreenView(),
      binding: LandingScreenBinding(),
    ),
    GetPage(
      name: _Paths.BERANDA,
      page: () => BerandaView(),
      binding: BerandaBinding(),
    ),
  ];
}
