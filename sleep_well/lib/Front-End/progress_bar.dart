import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sleep_well/Front-End/values.dart';
import './color_configurer.dart';

class ExpandableProgressBar extends StatefulWidget {
  const ExpandableProgressBar(this.icon, this.message, this.values,
      {super.key});
  final String icon;
  final String message;
  final double values;

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _ExpandableProgressBarState createState() =>
      // ignore: no_logic_in_create_state
      _ExpandableProgressBarState(icon, message, values);
}

class _ExpandableProgressBarState extends State<ExpandableProgressBar>
    with SingleTickerProviderStateMixin {
  _ExpandableProgressBarState(this.icon, this.message, this.values);

  Color color = ColorConfigurer.getColor(0.8);
  final String icon;
  final String message;
  final double values;

  late AnimationController _animationController;
  bool _isExpanded = false;
  Widget emptyBox = const SizedBox(
    height: 20,
  );

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
              if (_isExpanded) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
            });
          },
          child: Stack(
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      color: const Color.fromARGB(255, 198, 246, 255)
                          .withOpacity(0.8),
                      icon,
                      width: 41,
                      height: 41,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SizedBox(
                      height: 15,
                      width: 300,
                      child: LinearProgressIndicator(
                        backgroundColor:
                            const Color.fromARGB(255, 254, 252, 251)
                                .withOpacity(0.6),
                        value: values,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 3, 64, 120)),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 40,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RotationTransition(
                      turns: Tween(begin: 0.0, end: 0.5)
                          .animate(_animationController),
                      child: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        _isExpanded
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: const Color.fromARGB(255, 254, 252, 251),
                      child: Text(
                        message,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 18, 131, 162),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
