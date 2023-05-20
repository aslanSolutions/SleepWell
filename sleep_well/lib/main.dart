import 'package:firebase_core/firebase_core.dart';

import 'Front-End/screen_controller.dart';
import 'package:flutter/material.dart';

//The main class that run the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ScreenController());
}
