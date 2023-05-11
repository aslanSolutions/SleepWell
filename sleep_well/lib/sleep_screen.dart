import 'package:adv/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:lottie/lottie.dart';
import './labels.dart';

class SleepLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Calculating sleep score... ",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 221, 199, 6),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
    );
  }
}

class SleepScreen extends StatefulWidget {
  const SleepScreen({Key? key}) : super(key: key);

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  void goBackFunction() {
    Navigator.pop(context, 'reset');
  }

  Container buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 69, 125),
            Color.fromARGB(255, 0, 0, 0)
          ],
        ),
      ),
      constraints: const BoxConstraints.expand(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("S L E E P W E L L"),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          buildBackground(),
          Positioned(
            top: -50,
            left: -55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Lottie.asset(
                  "assets/animations/Night-Moon.json",
                  fit: BoxFit.cover,
                  width: 520,
                  height: 520,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Lottie.asset(
                  "assets/animations/Sleep.json",
                  fit: BoxFit.cover,
                  width: 620,
                  height: 620,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 40,
            child: Transform.translate(
              offset: const Offset(0, -50),
              child: SleepLabel(),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: SlideAction(
                borderRadius: 12,
                elevation: 0,
                innerColor: Colors.yellow,
                outerColor: Color.fromARGB(255, 0, 44, 80),
                sliderButtonIcon: const Icon(Icons.mode_night),
                text: "Slide to wake up",
                submittedIcon: Icon(
                  Icons.wb_sunny,
                  color: Colors.yellow,
                ),
                onSubmit: () {
                  goBackFunction();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}