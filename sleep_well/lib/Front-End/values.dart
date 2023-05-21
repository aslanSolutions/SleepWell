import 'package:collection/collection.dart';
import '../Service/FirbaseCrud.dart';

class Values {
  final int x;
  final double y;

  Values({required this.x, required this.y});
}

Future<List<Values>> getValues() async {
  List<Values> values = <Values>[];
  int counter = 0;

  try {
    // Retrieve the collection data from Firebase
    final firebaseData = await FirebaseCrud.readValue();

    // Iterate over the Firebase data and add the values to the 'data' list
    firebaseData.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        final double percent = value['percent'] as double;
        String formatted = percent.toStringAsFixed(2);
        double fixed = double.parse(formatted);
        values.add(Values(x: counter, y: fixed));
        counter++;
      }
    });

    return values;
  } catch (e) {
    print('Error retrieving data from Firebase: $e');
    return []; // Return an empty list in case of an error
  }
}
