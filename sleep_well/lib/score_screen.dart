import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sleep_well/progress_bar.dart';
import 'package:sleep_well/progress_circle.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen(this.goBack, {super.key});

  static const String humidityIcon = "assets/images/humidity.png";
  static const String lightIcon = "assets/images/light.png";
  static const String loudIcon = "assets/images/loud.png";
  static const String tempIcon = "assets/images/temp.png";

  final void Function() goBack;

  @override
  Widget build(context) {
    return Center(
      child: ListView(
        //mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 5,
                height: 5,
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 213, 179, 255),
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
              const SizedBox(width: 118),
              const Text(
                "Score",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const ProgressCircle(0.89, 120),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color:
                      const Color.fromARGB(255, 149, 89, 227).withOpacity(0.7),
                  child: const Text(
                    "Your overal sleep invairoment was good \nYou can see more details down below",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color:
                      const Color.fromARGB(255, 149, 89, 227).withOpacity(0.7),
                  child: Column(
                    children: const [
                      ExpandableProgressBar(lightIcon),
                      SizedBox(
                        height: 25,
                      ),
                      ExpandableProgressBar(tempIcon),
                      SizedBox(
                        height: 25,
                      ),
                      ExpandableProgressBar(loudIcon),
                      SizedBox(
                        height: 25,
                      ),
                      ExpandableProgressBar(humidityIcon),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
