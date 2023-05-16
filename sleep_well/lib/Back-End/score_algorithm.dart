import './Converter.dart';

class ScoreAlgorithm {
  ScoreAlgorithm();

  Converter converter = Converter();
  

  int calcluateLight (){
    List <int> lightScoreList = converter.getLight();
    int result = 0;
    for(int i = 0; i < lightScoreList.length-1 ; i++){
      result = result + lightScoreList[i];
    }
    return result;
  }
}
