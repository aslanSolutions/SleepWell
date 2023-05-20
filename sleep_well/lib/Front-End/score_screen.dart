import 'dart:ui';
import 'package:flutter/material.dart';
import './progress_circle.dart';
import './progress_bar.dart';
import 'package:sleep_well/Back-End/score_algorithm.dart';

import 'feed_back_message.dart';

class ScoreScreen extends StatefulWidget {
  ScoreScreen(this.goBack, {super.key});
  final void Function() goBack;

  @override
  // ignore: no_logic_in_create_state
  State<ScoreScreen> createState() => _ScoreScreenState(goBack);
}

class _ScoreScreenState extends State<ScoreScreen> {
  _ScoreScreenState(this.goBack);

  final void Function() goBack;
  static const String humidityIcon = "assets/images/humidity.png";
  static const String lightIcon = "assets/images/light.png";
  static const String loudIcon = "assets/images/loud.png";
  static const String tempIcon = "assets/images/temp.png";

  double paddingSize = 10;
  double values = ScoreAlgorithm().totalPercent() / 100;

  Container buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.white],
        ),
      ),
      constraints: const BoxConstraints.expand(),
    );
  }

  @override
  Widget build(context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 10,
          right: 0,
          child: SizedBox(
            height: 80,
            child: Row(
              children: [
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
                const SizedBox(width: 115),
                const Text(
                  "Score",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 124,
          left: 0,
          right: 0,
          bottom: 0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                ProgressCircle(values, 140),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: paddingSize, left: 8, right: 8, top: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: const Color.fromARGB(255, 18, 131, 162),
                        child: Text(
                          FeedbackMessage.getOverallMessage(values),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: paddingSize, left: 8, right: 8, top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 18, 131, 162),
                        child: ExpandableProgressBar(tempIcon,
                            FeedbackMessage.getTempMessage(values), values),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: paddingSize, left: 8, right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 18, 131, 162),
                        child: ExpandableProgressBar(lightIcon,
                            FeedbackMessage.getLightMessage(values), values),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: paddingSize, left: 8, right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 18, 131, 162),
                        child: ExpandableProgressBar(loudIcon,
                            FeedbackMessage.getLoudnessMessage(values), values),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: paddingSize, left: 8, right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 18, 131, 162),
                        child: ExpandableProgressBar(humidityIcon,
                            FeedbackMessage.getHumidityMessage(values), values),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
