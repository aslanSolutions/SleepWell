import 'package:sleep_well/log_screen.dart';
import 'package:sleep_well/score_screen.dart';
import 'package:sleep_well/sleep_screen.dart';
import './home_screen.dart';
import './loading_screen.dart';
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
<<<<<<< sleep_well/lib/screen_controller.dart
          switchToScore, switchToSleep, switchToLog, elapsedTimeNotifier);
=======
            switchToScore, switchToSleep, switchToLog, elapsedTimeNotifier);
>>>>>>> sleep_well/lib/screen_controller.dart
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
