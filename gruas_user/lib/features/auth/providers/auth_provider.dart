import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum UserRole { admin, user, worker }

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  User? get currentUser => _auth.currentUser;
  UserRole? _userRole;
  UserRole? get userRole => _userRole;
  
  bool get isAuthenticated => currentUser != null;
  bool get isAdmin => _userRole == UserRole.admin;

  bool _adminExists = false;
  bool get adminExists => _adminExists;

  bool _checkingAdmin = true;
  bool get checkingAdmin => _checkingAdmin;

  AuthProvider() {
    checkAdminExistence();
  }

  Future<void> checkAdminExistence() async {
    _checkingAdmin = true;
    notifyListeners();
    _adminExists = await _checkIfAdminExists();
    _checkingAdmin = false;
    notifyListeners();
  }
  
  Future<void> signIn(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (userCredential.user != null) {
        await _loadUserRole();
        await checkAdminExistence();
      }
      
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
  
  Future<bool> _checkIfAdminExists() async {
    final adminQuery = await _firestore
        .collection('users')
        .where('role', isEqualTo: 'admin')
        .limit(1)
        .get();
    
    return adminQuery.docs.isNotEmpty;
  }
  
  Future<void> signUp(String email, String password, String name, UserRole role) async {
    try {
      if (role == UserRole.admin) {
        final currentAdminExists = await _checkIfAdminExists();
        if (currentAdminExists && currentUser?.uid == null) {
           throw 'Ya existe un administrador en el sistema. Inicie sesión.';
        }
      } else if (role == UserRole.worker) {
        if (!isAdmin) {
          throw 'Solo los administradores pueden registrar trabajadores.';
        }
      }
      
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          'role': role.toString().split('.').last,
          'createdAt': FieldValue.serverTimestamp(),
          'createdBy': currentUser?.uid,
        });
        
        _userRole = role;
        if (role == UserRole.admin) {
          _adminExists = true;
        }
      }
      
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
  
  Future<void> signOut() async {
    await _auth.signOut();
    _userRole = null;
    notifyListeners();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }
  
  Future<void> _loadUserRole() async {
    if (currentUser != null) {
      final userDoc = await _firestore
          .collection('users')
          .doc(currentUser!.uid)
          .get();
      
      if (userDoc.exists) {
        final role = userDoc.data()?['role'] as String;
        _userRole = UserRole.values.firstWhere(
          (e) => e.toString().split('.').last == role,
        );
      }
    }
  }
} 