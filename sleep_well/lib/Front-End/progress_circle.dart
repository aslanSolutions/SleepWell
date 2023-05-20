import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sleep_well/Front-End/color_configurer.dart';

class ProgressCircle extends StatefulWidget {
  const ProgressCircle(this.progressValue, this.radius, {Key? key})
      : super(key: key);

  final double progressValue;
  final double radius;

  @override
  State<ProgressCircle> createState() =>
      // ignore: no_logic_in_create_state
      _ProgressCircleState(progressValue, radius);
}

class _ProgressCircleState extends State<ProgressCircle>
    with TickerProviderStateMixin {
  _ProgressCircleState(this.progressValue, this.radius);

  final double progressValue;
  final double radius;
  late AnimationController _scoreController;
  late Animation<double> _scoreAnimation;
  double displayedScore = 0;

  @override
  void initState() {
    super.initState();
    _scoreController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _scoreAnimation =
        Tween<double>(begin: 0, end: progressValue).animate(_scoreController)
          ..addListener(() {
            setState(() {
              displayedScore = _scoreAnimation.value;
            });
          });
    _scoreController.forward();
  }

  @override
  void dispose() {
    _scoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        animation: true,
        animateFromLastPercent: true,
        radius: radius,
        lineWidth: 50,
        progressColor: ColorConfigurer.getColor(displayedScore),
        backgroundColor: const Color.fromARGB(108, 18, 131, 162),
        circularStrokeCap: CircularStrokeCap.round,
        percent: displayedScore,
        center: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${(displayedScore * 100).toInt()}",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 64, 120),
                ),
              ),
              const Text(
                "SCORE AVG",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 64, 120),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
