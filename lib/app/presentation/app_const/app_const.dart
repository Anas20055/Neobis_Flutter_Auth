import 'package:flutter/material.dart';

abstract class AppConst{
  static const LinearGradient linearGradientBlue = LinearGradient(colors: [
    Color.fromRGBO(0, 116, 230, 1),
    Color.fromRGBO(79, 189, 239, 1),
  ]);
  static const LinearGradient linearGradientgrey = LinearGradient(colors: [
    myGreyColor,
    myGreyColor
  ]);

  static const Color myGreyColor = Color.fromRGBO(208, 208, 208, 1);
}