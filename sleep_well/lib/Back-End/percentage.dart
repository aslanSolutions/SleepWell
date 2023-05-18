import 'package:flutter/foundation.dart';

class Percentage {
  //Use if he value less than the total
  double calculator1(double score, double total) {
    double percent = (score * 100 / total);
    return percent;
  }

  //Use if he value bigger than the total
  double calculator2(double score, double total) {
    double percent = (total * 100 / score);
    return percent;
  }
}
