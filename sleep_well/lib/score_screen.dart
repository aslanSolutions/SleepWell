import 'dart:ui';
import 'package:flutter/material.dart';
import './progress_circle.dart';
import './progress_bar.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen(this.goBack, {super.key});
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

  Container buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.white],
        ),
      ),
      constraints: const BoxConstraints.expand(),
    );
  }

  Widget build(context) {
<<<<<<< sleep_well/lib/score_screen.dart
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
                      color: Color.fromARGB(255, 8, 102, 128),
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
                    fontSize: 30,
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
                const ProgressCircle(0.89, 140),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: paddingSize, left: 8, right: 8, top: 20),
=======
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        title: Text("S L E E P W E L L"),
      ),
      body: Stack(
        children: [
          buildBackground(),
          Center(
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
                          onPressed: switchScreen,
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
>>>>>>> sleep_well/lib/score_screen.dart
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
<<<<<<< sleep_well/lib/score_screen.dart
                        padding: const EdgeInsets.all(16),
                        color: const Color.fromARGB(255, 18, 131, 162),
                        child: const Text(
                          "Your overal sleep invairoment was good \nYou can see more details down below",
                          style: TextStyle(
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
                        child: const ExpandableProgressBar(tempIcon),
=======
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 149, 89, 227)
                            .withOpacity(0.7),
                        child: const Text(
                          "Your overal sleep Environment was good \nYou can see more details down below",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
>>>>>>> sleep_well/lib/score_screen.dart
                      ),
                    ),
                  ),
                ),
                Padding(
<<<<<<< sleep_well/lib/score_screen.dart
                  padding:
                      EdgeInsets.only(bottom: paddingSize, left: 8, right: 8),
=======
                  padding: const EdgeInsets.all(8.0),
>>>>>>> sleep_well/lib/score_screen.dart
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.all(10),
<<<<<<< sleep_well/lib/score_screen.dart
                        color: const Color.fromARGB(255, 18, 131, 162),
                        child: const ExpandableProgressBar(lightIcon),
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
                        child: const ExpandableProgressBar(loudIcon),
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
                        child: const ExpandableProgressBar(humidityIcon),
=======
                        color: const Color.fromARGB(255, 149, 89, 227)
                            .withOpacity(0.7),
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
>>>>>>> sleep_well/lib/score_screen.dart
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
