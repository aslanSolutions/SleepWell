import './log_screen_controller.dart';
import './values.dart';
import 'package:flutter/material.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        elevation: 0,
        title: Text("S L E E P W E L L"),
      ),
      body: Column(
        children: [
          Expanded(child: LogScreenController(values)),
        ],
      ),
    );
  }
}
