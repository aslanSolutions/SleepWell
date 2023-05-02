import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'values.dart';

class SleepLog extends StatelessWidget {
  final List<Values> scores;
  const SleepLog(this.scores, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade300,
              Colors.purple.shade600,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(50),
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
                  color: Color.fromARGB(255, 161, 6, 227),
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
