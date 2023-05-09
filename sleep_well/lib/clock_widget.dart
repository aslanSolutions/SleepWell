import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ClockWidget extends StatelessWidget {
  final double hoursSlept;

  const ClockWidget({required this.hoursSlept, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 430,
      left: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Lottie.asset(
            "assets/animations/Clock.json",
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          Text(
            ' Sleep time: $hoursSlept hours',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
