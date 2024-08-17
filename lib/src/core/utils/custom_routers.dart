import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_keys.dart';

class RoutingService {
  static push(Widget page) {
    Get.to(page,
        transition: Transition.leftToRightWithFade,
        duration: Duration(milliseconds: 500));
  }

  static pushReplacement(Widget page) {
    Get.off(page,
        transition: Transition.fadeIn, duration: Duration(milliseconds: 500));
  }

  static pushAndRemoveUntil(Widget page) {
    Navigator.pushAndRemoveUntil(
      NavigationService.navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static pop() {
    Get.back();
  }
}
