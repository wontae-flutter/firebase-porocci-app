import 'package:flutter/material.dart';

abstract class AppText {
  static const TextStyle progressHeader = TextStyle(
      color: Colors.black,
      fontSize: 40,
      height: 0.5,
      fontWeight: FontWeight.w600);

  static const TextStyle progressBody = TextStyle(
      color: Colors.white,
      fontSize: 10,
      height: 0.5,
      fontWeight: FontWeight.w400);

  static const TextStyle progressFooter = TextStyle(
      color: Colors.black,
      fontSize: 20,
      height: 0.5,
      fontWeight: FontWeight.w600);
}
