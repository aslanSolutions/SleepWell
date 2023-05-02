import 'package:flutter/material.dart';
import 'package:sleep_well/values.dart';
import '../log.dart';

class SleepLogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text('S L E E P  S C O R E'),
      ),
      body: SleepLog(values),
    );
  }
}
