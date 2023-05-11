import 'package:flutter/material.dart';

class TakeANapLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Take a nap ",
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
  }
}

class SleepLogLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Sleep Log ",
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
  }
}

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