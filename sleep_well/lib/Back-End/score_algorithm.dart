import './Converter.dart';

class ScoreAlgorithm {
  ScoreAlgorithm();

  Converter converter = Converter();

  int calcluateLight() {
    List<int> lightScoreList = converter.getLight();
    int result = 0;
    for (int i = 0; i < lightScoreList.length - 1; i++) {
      result = ((result + lightScoreList[i]) / i) as int;
    }
    return result;
  }

  int calculateTemperature() {
    List<int> tempScoreList = converter.getTemperature();
    int result2 = 0;
    for (int i = 0; i < tempScoreList.length - 1; i++) {
      result2 = ((result2 + tempScoreList[i]) / i) as int;
    }
    return result2;
  }

  int calculateLoudness() {
    List<int> loudnessScoreList = converter.getLoudness();
    int result = 0;
    for (int i = 0; i < loudnessScoreList.length - 1; i++) {
      result = ((result + loudnessScoreList[i]) / i) as int;
    }
    return result;
  }

  int calculateHumidity() {
    List<int> humidityScoreList = converter.getHumidity();
    int result = 0;
    for (int i = 0; i < humidityScoreList.length - 1; i++) {
      result = ((result + humidityScoreList[i]) / i) as int;
    }
    return result;
  }
}
