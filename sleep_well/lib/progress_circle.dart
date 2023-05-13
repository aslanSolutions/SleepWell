import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCircle extends StatefulWidget {
  const ProgressCircle(this.progressValue, this.radius, {Key? key})
      : super(key: key);

  final double progressValue;
  final double radius;

  @override
  State<ProgressCircle> createState() =>
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
        duration: const Duration(milliseconds: 1000), vsync: this);
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

  // the circle should change colors
  // todo assigned to Qutaiba

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        animation: true,
        animateFromLastPercent: true,
        radius: radius,
        lineWidth: 50,
        backgroundColor: Colors.white,
        circularStrokeCap: CircularStrokeCap.round,
        percent: displayedScore,
        center: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${(displayedScore * 100).toInt()}",
                style: TextStyle(
                    fontSize: 50, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              Text("SCORE AVG"),
            ],
          ),
        ),
      ),
    );
  }
}
