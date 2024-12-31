import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle SmallBold() {
    return TextStyle(
        fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black);
  }

  static TextStyle BigBold() {
    return TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);
  }

  static TextStyle Big() {
    return TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black);
  }

  static TextStyle pay() {
    return TextStyle(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.bold,

    );
  }
}
