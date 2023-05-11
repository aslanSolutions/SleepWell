import 'package:collection/collection.dart';

class Values {
  final int x;
  final int y;

  Values({required this.x, required this.y});
}

List<Values> get values {
  final data = <int>[80, 60, 40, 20, 50, 65, 72, 83, 94, 11];
  return data
      .mapIndexed(((index, element) => Values(x: index.toInt(), y: element)))
      .toList();
}
