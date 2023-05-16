import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ClockWidget extends StatelessWidget {
  final double hoursSlept;

  const ClockWidget({required this.hoursSlept, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/animations/Clock.json",
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          Text(
            '$hoursSlept hours',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 3, 64, 120)),
          ),
        ],
      ),
    );
  }
}
