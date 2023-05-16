import 'package:sleep_well/home_screen.dart';
import 'package:sleep_well/score_screen.dart';

import './log_screen_controller.dart';
import './values.dart';
import 'package:flutter/material.dart';
import 'package:sleep_well/screen_controller.dart';

class LogScreen extends StatelessWidget {
  const LogScreen(this.switchToScore, this.goBack, {super.key});
  final void Function() switchToScore;
  final void Function() goBack;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 8, 102, 128),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  iconSize: 20,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  onPressed: goBack,
                ),
              ),
            ),
            SizedBox(
              width: (screenWidth / 2) - 105,
            ),
            const Text(
              "History",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: LogScreenController(values),
        ),
        Expanded(
          child: LogScreen2(values, switchToScore),
        ),
      ],
    );
  }
}