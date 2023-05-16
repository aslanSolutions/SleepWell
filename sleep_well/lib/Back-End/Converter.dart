import 'dart:collection';

import 'package:flutter/material.dart';

late List<int> light;
late List<int> loudness;
late List<int> temperature;
late List<int> humidity;

class Converter {
  Converter() {
    light = List<int>.filled(0, 0, growable: true);
    loudness = List<int>.filled(0, 0, growable: true);
    temperature = List<int>.filled(0, 0, growable: true);
    humidity = List<int>.filled(0, 0, growable: true);
  }

  void convert(String values) {
    var valuesList = values.split(', ');
    light.add(int.parse(valuesList[0].trim()));
    loudness.add(int.parse(valuesList[1].trim()));
    temperature.add(int.parse(valuesList[2].trim()));
    humidity.add(int.parse(valuesList[3].trim()));
    print(light);
    print(temperature);
  }
}
