
import 'package:flutter/material.dart';

class Styles extends TextStyle{
  static TextStyle black(Color color, var height, double? fontSize, FontWeight? fontWeight) {
    return  TextStyle(
        // fontFamily: Fonts.roboBlack,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal, color: color, decoration: TextDecoration.none);
  }
  static TextStyle bold(Color color, var height, double? fontSize, FontWeight? fontWeight) {
    return  TextStyle(
        // fontFamily: Fonts.roboBold,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal, color: color, decoration: TextDecoration.none);
  }
  static TextStyle light(Color color, var height, double? fontSize, FontWeight? fontWeight) {
    return  TextStyle(
        // fontFamily: Fonts.roboLight,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal, color: color, decoration: TextDecoration.none);
  }
  static TextStyle medium(Color color, var height, double? fontSize, FontWeight? fontWeight) {
    return  TextStyle(
        // fontFamily: Fonts.roboMedium,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal, color: color, decoration: TextDecoration.none);
  }
  static TextStyle regular(Color color, var height, double? fontSize, FontWeight? fontWeight) {
    return  TextStyle(
        // fontFamily: Fonts.roboRegular,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal, color: color, decoration: TextDecoration.none);
  }
  static TextStyle thin(Color color, var height, double? fontSize, FontWeight? fontWeight) {
    return  TextStyle(
        // fontFamily: Fonts.roboThin,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal, color: color, decoration: TextDecoration.none);
  }
}