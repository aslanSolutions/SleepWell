import './values.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import './score_screen.dart';

// class
class LogScreenController extends StatelessWidget {
  final List<Values> scores;

  const LogScreenController(this.scores, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 3, 64, 120),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            AspectRatio(
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
                      color: Color.fromARGB(255, 0, 25, 94),
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
                          show: true,
                          color:
                              Color.fromARGB(255, 3, 91, 163).withOpacity(0.3)),
                      isCurved: true,
                      barWidth: 4,
                      color: Color.fromARGB(255, 197, 77, 69),
                      spots: scores
                          .map((score) => FlSpot(
                              score.x.toDouble() + 1, score.y.toDouble()))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            const Text("Days",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
          ],
        ),
      );
}

// todo add logscreen 2
class LogScreen2 extends StatelessWidget {
  const LogScreen2(this.scores, this.switchToScore, {Key? key})
      : super(key: key);
  final List<Values> scores;
  final void Function() switchToScore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep Well',
      home: Scaffold(
        body: ListView.builder(
          itemCount: scores.length,
          itemBuilder: (context, index) {
            return _buildCard(
              (index + 1).toString(),
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
                      'Day $day ',
                      style: const TextStyle(
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
                      switchToScore();
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
