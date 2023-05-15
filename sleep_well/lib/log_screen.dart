import 'package:sleep_well/home_screen.dart';
import 'package:sleep_well/score_screen.dart';

import './log_screen_controller.dart';
import './values.dart';
import 'package:flutter/material.dart';
import 'package:sleep_well/screen_controller.dart';

class LogScreen extends StatelessWidget {
  const LogScreen(this.switchToScore, this.goBack, {super.key});
  final void Function() switchToScore;
  final void Function() goBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        title: const Text("S L E E P W E L L"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: goBack,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: LogScreenController(values),
          ),
          Expanded(
            child: LogScreen2(values, switchToScore),
          ),
        ],
      ),
    );
  }
}



/*import './log_screen_controller.dart';
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
}*/
