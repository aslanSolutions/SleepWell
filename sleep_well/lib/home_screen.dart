import 'dart:async';
import './clock_widget.dart';
import './progress_circle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'labels.dart';
import 'package:lottie/lottie.dart';
import './sleep_screen.dart';
//import 'MQTT/BrokerConnection.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.switchToScore, this.switchTosleep, this.switchToLog,
      this.elapsedTimeNotifier,
      {Key? key})
      : super(key: key);
  final void Function() switchToScore;
  final void Function() switchTosleep;
  final void Function() switchToLog;
  final ValueNotifier<String> elapsedTimeNotifier;

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _HomeScreenState createState() =>
      _HomeScreenState(switchToScore, switchTosleep, switchToLog);
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  _HomeScreenState(this.switchToScore, this.switchTosleep, this.switchToLog);

  late AnimationController _controller;
  late AnimationController _controller2;
  //late BrokerConnection _connection;

  final void Function() switchToScore;
  final void Function() switchTosleep;
  final void Function() switchToLog;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    _controller2 = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  bool marked = false;
  bool marked2 = false;

  void _onBedTap(BuildContext context) async {
    if (marked == false) {
      marked = true;
      _controller.forward();
      await Future.delayed(const Duration(milliseconds: 900));
      //_connection = BrokerConnection(context);
      switchTosleep();
      marked = false;
      _controller.reset();
    }
  }

  void _onLogTap(BuildContext context) async {
    if (marked2 == false) {
      marked2 = true;
      _controller2.forward();
      await Future.delayed(const Duration(milliseconds: 700));
      switchToLog();
      marked2 = false;
      _controller2.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 70.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "SLEEP WELL",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  switchToScore();
                },
                child: const ProgressCircle(0.89, 150),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder<String>(
              valueListenable: widget.elapsedTimeNotifier,
              builder: (context, value, child) {
                return ClockWidget(
                    lastElapsedTime: value); // pass the value here
              },
            ),
            const SizedBox(
              height: 120,
            ),
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(-40, -22),
                  child: GestureDetector(
                    onTap: () {
                      _onBedTap(context);
                    },
                    child: Lottie.asset(
                      "assets/animations/king-bed.json",
                      controller: _controller,
                      fit: BoxFit.cover,
                      width: 155,
                      height: 155,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 120,
                ),
                Transform.translate(
                  offset: const Offset(-15, -30),
                  child: GestureDetector(
                    onTap: () {
                      _onLogTap(context);
                    },
                    child: Lottie.asset(
                      "assets/animations/sleep-time.json",
                      controller: _controller2,
                      fit: BoxFit.cover,
                      width: 130,
                      height: 130,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: FractionallySizedBox(
            heightFactor: 0.13, // adjust the factor as needed
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 50.0), // adjust padding as needed
              child: TakeANapLabel(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FractionallySizedBox(
            heightFactor: 0.13, // adjust the factor as needed
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 40.0), // adjust padding as needed
              child: SleepLogLabel(),
            ),
          ),
        ),
      ],
    );
  }
}
