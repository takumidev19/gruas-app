import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String firebaseApiKey = 'AIzaSyAQqrXqYKz9eYelnzIEXWhqBfUORyqkUug';

class UsersService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<QuerySnapshot> getUsers() {
    return _firestore.collection('users').snapshots();
  }

  Future<DocumentSnapshot> getUserById(String userId) {
    return _firestore.collection('users').doc(userId).get();
  }

  Future<bool> verifyAdminPassword(String password) async {
    print('Entrando a verifyAdminPassword');
    try {
      final user = _auth.currentUser;
      print('Usuario actual: $user');
      if (user == null) return false;

      // Crear credenciales con el email actual y la contraseña proporcionada
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );
      print('Intentando reautenticar...');
      await user.reauthenticateWithCredential(credential);
      print('Reautenticación exitosa');
      return true;
    } catch (e) {
      print('Error en verificación de contraseña: $e');
      rethrow;
    }
  }

  Future<void> updateUser(String userId, Map<String, dynamic> userData) async {
    await _firestore.collection('users').doc(userId).update(userData);
  }

  Future<bool> verifyPasswordWithApi(String email, String password) async {
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseApiKey';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': false,
      }),
    );

    if (response.statusCode == 200) {
      // Contraseña correcta
      return true;
    } else {
      print('Error REST API: ${response.body}');
      return false;
    }
  }
} 