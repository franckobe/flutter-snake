import 'dart:ui';
import 'package:flutter/material.dart';

class ValleyColors {

  static Color yellow1 = Color(0xfffddc51);
  static Color yellow2 = Color(0xffffc838);
  static Color orange1 = Color(0xfff57c33);
  static Color orange2 = Color(0xfff05222);
  static Color red = Color(0xffe32026);
  static Color purple1 = Color(0xff942166);
  static Color purple2 = Color(0xff6f1d58);

  static LinearGradient linearGradient = LinearGradient(
    colors: [
      ValleyColors.purple2,
      ValleyColors.purple1,
      ValleyColors.red,
      ValleyColors.orange2,
      ValleyColors.orange1,
      ValleyColors.yellow2,
      ValleyColors.yellow1,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}