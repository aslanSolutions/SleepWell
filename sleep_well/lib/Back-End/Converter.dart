import 'dart:collection';

import 'package:flutter/material.dart';

List<int> light = List<int>.filled(0, 0, growable: true);
List<int> loudness = List<int>.filled(0, 0, growable: true);
List<int> temperature = List<int>.filled(0, 0, growable: true);
List<int> humidity = List<int>.filled(0, 0, growable: true);

class Converter {
  Converter();

  void convert(String values) {
    var valuesList = values.split(', ');
    light.add(int.parse(valuesList[0].trim()));
    loudness.add(int.parse(valuesList[1].trim()));
    temperature.add(int.parse(valuesList[2].trim()));
    humidity.add(int.parse(valuesList[3].trim()));
  }

  List<int> getLight() {
    return light;
  }

  List<int> getLoudness() {
    return loudness;
  }

  List<int> getTemperature() {
    return temperature;
  }

  List<int> getHumidity() {
    return humidity;
  }
}
