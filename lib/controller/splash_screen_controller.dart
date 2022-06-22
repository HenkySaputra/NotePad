import 'dart:async';

import 'package:get/get.dart';
import 'package:project_akhir/screen/home_screen.dart';
import 'package:project_akhir/screen/landing_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 5), () {
      Get.off(LandingPage());
    });
  }
}
