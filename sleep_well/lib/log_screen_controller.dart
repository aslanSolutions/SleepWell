import './values.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import './score_screen.dart';

class LogScreenController extends StatelessWidget {
  final List<Values> scores;
  const LogScreenController(this.scores, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade600,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(50),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: true)),
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: false,
                )),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Color.fromARGB(255, 7, 65, 225),
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(),
              ),
              lineBarsData: [
                LineChartBarData(
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                      show: true, color: Colors.blue.withOpacity(0.3)),
                  isCurved: true,
                  barWidth: 4,
                  color: Colors.blue,
                  spots: scores
                      .map((score) =>
                          FlSpot(score.x.toDouble(), score.y.toDouble()))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      );
}

// todo add logscreen 2