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
