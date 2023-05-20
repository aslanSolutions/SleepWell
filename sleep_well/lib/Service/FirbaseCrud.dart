import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sleep_well/Service/Response.dart';

final FirebaseFirestore _firebase = FirebaseFirestore.instance;
final CollectionReference _collection = _firebase.collection('values');

class FirebaseCrud {
  static Future<Response> addValue({
    required day,
    required value,
  }) async {
    Response response = Response();

    DocumentReference documentReference = _collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      'data': day,
      'percent': value
    };

    var result = await documentReference.set(data).whenComplete(() {
      response.code = 0;
      response.message = 'Successfully done';
    }).catchError((e) {
      response.code = -1;
      response.message = e;
    });
    return response;
  }

  static Stream<QuerySnapshot> readValue() {
    final CollectionReference _noteCollection = _collection;
    return _noteCollection.snapshots();
  }
}
