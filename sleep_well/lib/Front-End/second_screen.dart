import 'package:flutter/material.dart';
import 'home_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen(this.goBack, {super.key});
  final void Function() goBack;

  @override
  State<SecondScreen> createState() {
    // ignore: no_logic_in_create_state
    return _SecondScreenState(goBack);
  }
}

class _SecondScreenState extends State<SecondScreen> {
  _SecondScreenState(this.goBack);

  final void Function() goBack;

  @override
  Widget build(context) {
    return Column(
      children: [
        const Text(
          "Second Screnn",
          style: TextStyle(fontSize: 50),
        ),
        OutlinedButton(onPressed: goBack, child: const Text("back"))
      ],
    );
  }
}
