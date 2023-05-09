import './home_screen.dart';
import 'package:flutter/material.dart';
import './second_screen.dart';

//This class handles switching screen and rendring the new UI when a new screen is displayed
class ScreenController extends StatefulWidget {
  const ScreenController({super.key});

  @override
  State<ScreenController> createState() {
    return _ScreenControllerState();
  }
}

class _ScreenControllerState extends State<ScreenController> {
  Widget? activeScreen;

  //Initialize the first screen that will be loaded
  @override
  void initState() {
    activeScreen = HomeScreen(goBack);
    super.initState();
  }

  // Switch to the --- screen
  void switchScreen() {
    setState(() {
      activeScreen = HomeScreen(goBack);
    });
  }

  // Switch to the score screen
  void goBack() {}

  // The main layout of the application (Background colors),
  // Should force all loaded screen to have this layout.
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),

          //Loads the screen
          child: activeScreen,
        ),
      ),
    );
  }
}
