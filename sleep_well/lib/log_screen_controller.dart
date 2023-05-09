import 'package:adv/values.dart';
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

class LogScreen2 extends StatelessWidget {
  final List<Values> scores;
  const LogScreen2(this.scores, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep Well',
      home: Scaffold(
        body: ListView.builder(
          itemCount: scores.length,
          itemBuilder: (context, index) {
            return _buildCard(
              scores[index].x.toString(),
              'Sleep Condition', // Here you would put the correct sleep condition. I'm just using a placeholder.
              scores[index].y.toString(),
              context,
            );
          },
        ),
      ),
    );
  }

  Card _buildCard(
      // not sure how to use the sleepCondition in relation to score, so its just using day now.
      String day,
      String sleepCondition,
      String score,
      BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Day ' + day,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    sleepCondition,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => ScoreScreen(() {}),
                        ),
                      );
                    },
                    child: const Text('More details'),
                  )
                ],
              ),
            ),
            Icon(
              Icons.bar_chart_sharp,
              color: Colors.red[500],
            ),
            Text(score),
          ],
        ),
      ),
    );
  }
}
