import 'package:flutter/material.dart';

const Color whiteColor = Colors.white;
const Color transparent = Colors.transparent;
const Color blackColor = Colors.black;
const Color primaryColor = Color.fromRGBO(45, 46, 131, 1);
const Color backgroundColor = Color.fromRGBO(249, 249, 249, 1);
const Color backgroundColor2 = Color.fromRGBO(255, 255, 255, 1);
const Color onBoardingAgreement = Color.fromRGBO(252, 163, 77, 1);
const Color hintColor = Color.fromRGBO(170, 166, 185, 1);
const Color textColor = Color.fromRGBO(13, 1, 64, 1);
const Color greyColor = Color(0xffF3F3F3);

class AppColors {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
