import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Info extends StatefulWidget {
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> with TickerProviderStateMixin {
  late final _animationController = AnimationController(vsync: this);

  @override
  void initState() {
    super.initState();
    _loadAnimation();
  }

  Future<void> _loadAnimation() async {
    await Future.delayed(Duration(milliseconds: 100));
    await _animationController.repeat(
        min: 0, max: 1, period: Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/animations/bed.json",
            controller: _animationController),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
