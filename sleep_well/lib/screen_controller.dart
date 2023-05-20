import 'Front-End/log_screen.dart';
import './Front-End/score_screen.dart';
import './Front-End/sleep_screen.dart';
import 'Front-End/home_screen.dart';
import 'Front-End/loading_screen.dart';
import 'package:flutter/material.dart';

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
  ValueNotifier<String> elapsedTimeNotifier = ValueNotifier<String>('00:00:00');
  //Initialize the first screen that will be loaded

  @override
  void initState() {
    activeScreen = const LoadingScreen();
    navigateToHomeScreen();
    super.initState();
  }

  void navigateToHomeScreen() {
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
        activeScreen = HomeScreen(
            switchToScore, switchToSleep, switchToLog, elapsedTimeNotifier);
      });
    });
  }

  // Switch to the --- screen

  void switchToSleep() {
    setState(() {
      activeScreen = SleepScreen(switchToScore, elapsedTimeNotifier);
    });
  }

  void switchToScore() {
    setState(() {
      activeScreen = ScoreScreen(switchToHome);
    });
  }

  void switchToLog() {
    setState(() {
      activeScreen = LogScreen(switchToScore, switchToHome);
    });
  }

  void switchToHome() {
    setState(() {
      activeScreen = HomeScreen(
          switchToScore, switchToSleep, switchToLog, elapsedTimeNotifier);
    });
  }

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
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Color.fromARGB(255, 18, 131, 162),
                BlendMode.color,
              ),
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
