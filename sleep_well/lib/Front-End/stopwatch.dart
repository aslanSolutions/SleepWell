import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

// this class was implemented through a package, the code was tweaked alot but was mostly taken from a premade version
class CountUpTimerPage extends StatefulWidget {
  final void Function(String) onTimeRecorded;

  CountUpTimerPage({required this.onTimeRecorded});

  @override
  _State createState() => _State();
}

class _State extends State<CountUpTimerPage> {
  final _isHours = true;
  String lastElapsedTime = '';

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    onStopped: () {
      print('onStop');
    },
    onEnded: () {
      print('onEnded');
    },
  );

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
  }

  @override
  void dispose() async {
    super.dispose();
    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    await Future.delayed(
        Duration(seconds: 1)); // Give some time for the stopwatch to stop.
    lastElapsedTime = StopWatchTimer.getDisplayTime(
        _stopWatchTimer.rawTime.value,
        hours: _isHours,
        milliSecond: false);
    widget.onTimeRecorded(lastElapsedTime);
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _stopWatchTimer.rawTime,
      initialData: _stopWatchTimer.rawTime.value,
      builder: (context, snap) {
        final value = snap.data!;
        final displayTime = StopWatchTimer.getDisplayTime(value,
            hours: _isHours, milliSecond: false);
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            displayTime,
            style: const TextStyle(
                color: Colors.yellow,
                fontSize: 40,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
