import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tamenny_app/core/services/database_service.dart';
import 'package:tamenny_app/core/utils/backend_end_point.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await _firestore.collection(path).doc(documentId).set(data);
    } else {
      await _firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    var data = await _firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await _firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = _firestore.collection(path);

      if (query != null) {
        if (query.containsKey('orderBy')) {
          data = data.orderBy(
            query['orderBy'],
            descending: query['descending'] ?? false,
          );
        }

        if (query.containsKey('limit')) {
          data = data.limit(query['limit']);
        }
      }

      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<void> updateUserAvatar(
      {required String userId, required String imageUrl}) async {
    await _firestore
        .collection(BackendEndPoint.updateUserData)
        .doc(userId)
        .update({'userAvatarUrl': imageUrl});
  }
}
