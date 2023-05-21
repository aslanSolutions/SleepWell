import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:sleep_well/Back-End/score_algorithm.dart';
import 'package:sleep_well/Service/Response.dart';

final FirebaseFirestore _firebase = FirebaseFirestore.instance;
final CollectionReference _collection = _firebase.collection('values');

class FirebaseCrud {
  static Future<Response> addValue({
    required DateTime date,
    required double value,
  }) async {
    Response response = Response();

    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    DocumentReference documentReference =
        _collection.doc(formattedDate); // Use formatted date as the document ID

    Map<String, dynamic> data = {
      'percent': value,
    };

    try {
      await documentReference.set(data);

      response.code = 0;
      response.message = 'Successfully done';
    } catch (e) {
      response.code = -1;
      response.message = e.toString();
    }

    return response;
  }

  static Future<Map<String, dynamic>> readValue() async {
    final QuerySnapshot querySnapshot = await _collection.get();
    final Map<String, dynamic> dataMap = {};

    for (final DocumentSnapshot docSnapshot in querySnapshot.docs) {
      dataMap[docSnapshot.id] = docSnapshot.data();
    }

    return dataMap;
  }
}
