import 'package:flutter/material.dart';

class ColorConfigurer {
  static Color getColor(double progressValue) {
    if (progressValue >= 0.9) {
      return const Color.fromARGB(255, 8, 220, 15);
    } else if (progressValue >= 0.7) {
      return const Color.fromARGB(255, 1, 200, 64);
    } else if (progressValue >= 0.5) {
      return Colors.yellow;
    } else if (progressValue >= 0.4) {
      return const Color.fromARGB(255, 255, 131, 59);
    } else {
      return Colors.red;
    }
  }
}
