import 'dart:ui';

import 'package:flutter/material.dart';

class ExpandableProgressBar extends StatefulWidget {
  const ExpandableProgressBar(this.icon, {super.key});
  final String icon;

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _ExpandableProgressBarState createState() =>
      // ignore: no_logic_in_create_state
      _ExpandableProgressBarState(icon);
}

class _ExpandableProgressBarState extends State<ExpandableProgressBar>
    with SingleTickerProviderStateMixin {
  _ExpandableProgressBarState(this.icon);

  final String icon;

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
      children: <Widget>[
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
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      icon,
                      width: 41,
                      height: 41,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: const SizedBox(
                      height: 15,
                      width: 300,
                      child: LinearProgressIndicator(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        value: 0.82,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 10, 200, 22)),
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
                  borderRadius: BorderRadius.circular(8.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: const Color.fromARGB(255, 85, 0, 150)
                          .withOpacity(0.5),
                      child: const Text(
                        'This text will contain information about the score of this indivuall sensor and will give some suggestions to make it better',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
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
