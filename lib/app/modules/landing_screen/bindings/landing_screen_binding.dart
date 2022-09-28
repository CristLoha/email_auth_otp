import 'package:flutter_firebase_crud/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/landing_screen_controller.dart';

class LandingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingScreenController>(
      () => LandingScreenController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
