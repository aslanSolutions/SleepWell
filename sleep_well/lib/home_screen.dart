import 'dart:async';
import 'package:adv/clock_widget.dart';
import 'package:adv/log_screen.dart';
import 'package:adv/progress_circle.dart';
import 'package:adv/sleep_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'labels.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.goBack, {Key? key}) : super(key: key);
  final void Function() goBack;

  @override
  _HomeScreenState createState() => _HomeScreenState(goBack);
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  _HomeScreenState(this.goBack);

  late AnimationController _controller;
  late AnimationController _controller2;
  final void Function() goBack;

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
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SleepScreen()));
      marked = false;
      _controller.reset();
    }
  }

  void _onLogTap(BuildContext context) async {
    if (marked2 == false) {
      marked2 = true;
      _controller2.forward();
      await Future.delayed(const Duration(milliseconds: 700));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LogScreen()),
      ).then((value) {
        marked2 = false;
        _controller2.reset();
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        title: Text("S L E E P W E L L"),
      ),
      body: Stack(
        children: [
          buildBackground(),
          ClockWidget(hoursSlept: 3),
          Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    goBack();
                  },
                  child: const ProgressCircle(0.89, 150),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              Row(
                children: [
                  Transform.translate(
                    offset: const Offset(-40, -60),
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
                    offset: const Offset(-15, -68),
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
          Positioned(
            bottom: 10,
            left: 50,
            right: 0,
            child: Transform.translate(
              offset: const Offset(0, -50),
              child: TakeANapLabel(),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 40,
            child: Transform.translate(
              offset: const Offset(0, -50),
              child: SleepLogLabel(),
            ),
          ),
        ],
      ),
    );
  }
}
