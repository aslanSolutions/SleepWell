import './log_screen_controller.dart';
import './values.dart';
import 'package:flutter/material.dart';

class LogScreen extends StatelessWidget {
  const LogScreen(this.switchToScore, {super.key});
  final void Function() switchToScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        title: const Text("S L E E P W E L L"),
      ),
      body: Column(
        children: [
          Expanded(
            child: LogScreenController(values),
          ),
          Expanded(child: LogScreen2(values, switchToScore))
        ],
      ),
    );
  }
}
