import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Obtener una colección
  CollectionReference getCollection(String collection) {
    return _firestore.collection(collection);
  }

  // Obtener un documento
  Future<DocumentSnapshot> getDocument(String collection, String id) async {
    return await _firestore.collection(collection).doc(id).get();
  }

  // Crear un documento
  Future<DocumentReference> createDocument(
    String collection,
    Map<String, dynamic> data,
  ) async {
    return await _firestore.collection(collection).add(data);
  }

  // Actualizar un documento
  Future<void> updateDocument(
    String collection,
    String id,
    Map<String, dynamic> data,
  ) async {
    await _firestore.collection(collection).doc(id).update(data);
  }

  // Eliminar un documento
  Future<void> deleteDocument(String collection, String id) async {
    await _firestore.collection(collection).doc(id).delete();
  }

  // Obtener documentos con filtros
  Future<QuerySnapshot> getDocumentsWithFilters(
    String collection, {
    String? field,
    dynamic isEqualTo,
    dynamic isGreaterThan,
    dynamic isLessThan,
    int? limit,
  }) async {
    Query query = _firestore.collection(collection);

    if (field != null) {
      if (isEqualTo != null) {
        query = query.where(field, isEqualTo: isEqualTo);
      }
      if (isGreaterThan != null) {
        query = query.where(field, isGreaterThan: isGreaterThan);
      }
      if (isLessThan != null) {
        query = query.where(field, isLessThan: isLessThan);
      }
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    return await query.get();
  }

  // Obtener documentos en tiempo real
  Stream<QuerySnapshot> streamCollection(String collection) {
    return _firestore.collection(collection).snapshots();
  }

  // Obtener un documento en tiempo real
  Stream<DocumentSnapshot> streamDocument(String collection, String id) {
    return _firestore.collection(collection).doc(id).snapshots();
  }
} 