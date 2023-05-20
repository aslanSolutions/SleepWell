import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

void writeDataToJsonFile(DateTime date, double average) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/data.json');
  print(directory);

  // Create a map representing the data
  final data = {'date': date.toString(), 'average': average};

  String jsonData;

  if (file.existsSync()) {
    // Read the existing JSON data from the file
    final existingData = await file.readAsString();

    // Append a comma and the new data to the existing JSON data
    jsonData = '$existingData,${json.encode(data)}';
  } else {
    // Create a new JSON array with the data as the first object
    jsonData = '[${json.encode(data)}]';
  }

  // Write the JSON data to the file
  await file.writeAsString(jsonData);

  print('Data written to JSON file.');
}
