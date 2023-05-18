import './Converter.dart';
import './percentage.dart';

Converter converter = Converter();
double result = 0;
int counter = 0;
double percent = 0;
late double total;

class ScoreAlgorithm {
  ScoreAlgorithm();

  //Calculating the light percent
  double calcluateLight() {
    List<int> lightScoreList = converter.getLight();
    total = 7.0;
    for (int i = 0; i < lightScoreList.length - 1; i++) {
      result = result + lightScoreList[i];
      counter = i;
    }
    result = result / counter;

    if (result > total) {
      percent = Percentage().calculator2(result, total);
    } else {
      percent = Percentage().calculator1(result, total);
    }
    return percent;
  }

  //Calculating the temperature percent
  double calculateTemperature() {
    List<int> tempScoreList = converter.getTemperature();
    total = 17.6;
    for (int i = 0; i < tempScoreList.length - 1; i++) {
      result = result + tempScoreList[i];
    }
    result = result / counter;

    if (result > total) {
      percent = Percentage().calculator2(result, total);
    } else {
      percent = Percentage().calculator1(result, total);
    }
    return percent;
  }

  //Calculating the loud percent
  double calculateLoudness() {
    List<int> loudnessScoreList = converter.getLoudness();
    total = 30;
    for (int i = 0; i < loudnessScoreList.length - 1; i++) {
      result = result + loudnessScoreList[i];
    }
    result = result / counter;

    if (result > total) {
      percent = Percentage().calculator2(result, total);
    } else {
      percent = Percentage().calculator1(result, total);
    }
    return percent;
  }

  //Calculating the humidity percent
  double calculateHumidity() {
    List<int> humidityScoreList = converter.getHumidity();
    total = 50;
    for (int i = 0; i < humidityScoreList.length - 1; i++) {
      result = result + humidityScoreList[i];
    }
    result = result / counter;

    if (result > total) {
      percent = Percentage().calculator2(result, total);
    } else {
      percent = Percentage().calculator1(result, total);
    }
    return percent;
  }

  //Calculating the all sensors percent
  double totalPercent() {
    percent = ((calcluateLight() / 4) +
        (calculateHumidity() / 4) +
        (calculateLoudness() / 4) +
        (calculateTemperature() / 4));
    return percent;
  }
}
