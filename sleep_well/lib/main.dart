import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'info.dart';
import './sleep.dart';
import './screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaQuery(
        data: MediaQueryData(textScaleFactor: 1.0),
        child: MyWidget(),
      ),
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    _controller2 =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
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
      await Future.delayed(Duration(milliseconds: 900));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Sleep()));
    }
  }

  void _onLogTap(BuildContext context) async {
    if (marked2 == false) {
      marked2 = true;
      _controller2.forward();
      await Future.delayed(Duration(milliseconds: 700));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SleepLogScreen()),
      ).then((value) {
        // This code will be executed when the user navigates back to the main screen.
        marked2 = false;
        _controller2.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          elevation: 0,
          title: Text("S L E E P W E L L"),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.white],
                ),
              ),
              constraints: const BoxConstraints.expand(),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Info()),
                  );
                },
                child: CircularPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  radius: 330,
                  lineWidth: 50,
                  percent: 0.75,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.white,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: const Text(
                    "75",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: -30,
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    _onBedTap(context);
                  },
                  child: Lottie.asset(
                    "assets/animations/king-bed.json",
                    controller: _controller,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              right: 20,
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    _onLogTap(context);
                  },
                  child: Lottie.asset(
                    "assets/animations/sleep-time.json",
                    controller: _controller2,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -5,
              left: 27,
              right: 0,
              child: Transform.translate(
                offset: const Offset(0, -50),
                child: const Text(
                  "Take a nap ",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Positioned(
              bottom: -5,
              left: 262,
              child: Transform.translate(
                offset: const Offset(0, -50),
                child: const Text(
                  "Sleep Log ",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
