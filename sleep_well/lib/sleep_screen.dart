import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:lottie/lottie.dart';
import 'MQTT/BrokerConnection.dart';
import './stopwatch.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen(this.switchToScore, this.elapsedTimeNotifier, {Key? key})
      : super(key: key);
  final void Function() switchToScore;
  final ValueNotifier<String> elapsedTimeNotifier; // Add this line

  @override
  // ignore: no_logic_in_create_state
  State<SleepScreen> createState() => _SleepScreenState(
      switchToScore, elapsedTimeNotifier); // Pass elapsedTimeNotifier here
}

class _SleepScreenState extends State<SleepScreen> {
  _SleepScreenState(this.switchToScore, this.elapsedTimeNotifier);

  late BrokerConnection _connection;
  final void Function() switchToScore;
  final ValueNotifier<String> elapsedTimeNotifier; // Replace this line

  Container buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 3, 47, 83),
            Color.fromARGB(255, 14, 1, 47)
          ],
        ),
      ),
      constraints: const BoxConstraints.expand(),
    );
  }

  @override
  Widget build(context) {
    _connection = BrokerConnection(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        buildBackground(),
        SizedBox(
          height: 650,
          width: screenWidth,
          child: Image.asset("assets/images/background2.png"),
        ),
        Positioned(
          bottom: 150,
          right: 112,
          child: CountUpTimerPage(
            onTimeRecorded: (time) {
              elapsedTimeNotifier.value = time; // Updated this line
            },
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "SLEEP WELL",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.asset(
              "assets/animations/Night-Moon.json",
              fit: BoxFit.cover,
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: -750,
          child: Lottie.asset(
            "assets/animations/Sleep.json",
            fit: BoxFit.contain,
            width: 500,
            height: 100,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: -250,
          child: SizedBox(
            width: 100,
            child: SlideAction(
              borderRadius: 12,
              elevation: 0,
              innerColor: Colors.yellow,
              outerColor: const Color.fromARGB(255, 0, 44, 80),
              sliderButtonIcon: const Icon(Icons.mode_night),
              text: "Slide to wake up",
              submittedIcon: const Icon(
                Icons.wb_sunny,
                color: Colors.yellow,
              ),
              onSubmit: () {
                switchToScore();
                _connection.disConnect();
              },
            ),
          ),
        ),
      ],
    );
  }
}
