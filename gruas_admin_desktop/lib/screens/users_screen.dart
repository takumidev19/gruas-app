import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/users_service.dart';
import '../widgets/password_verification_dialog.dart';
import '../widgets/edit_user_dialog.dart';
import 'package:intl/intl.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final UsersService _usersService = UsersService();
  final Map<String, String> _userNamesCache = {};

  Future<String> _getUserNameById(String userId) async {
    if (_userNamesCache.containsKey(userId)) {
      return _userNamesCache[userId]!;
    }
    try {
      final doc = await _usersService.getUserById(userId);
      final data = doc.data() as Map<String, dynamic>?;
      final name = data?['name'] ?? 'Desconocido';
      _userNamesCache[userId] = name;
      return name;
    } catch (_) {
      return 'Desconocido';
    }
  }

  Future<void> _showEditDialog(BuildContext context, String userId, Map<String, dynamic> userData) async {
    if (!mounted) return;
    
    final BuildContext dialogContext = context;
    
    // Primero mostrar el diálogo de verificación de contraseña
    final verified = await showDialog<bool>(
      context: dialogContext,
      builder: (context) => PasswordVerificationDialog(
        onVerified: () => Navigator.of(context).pop(true),
      ),
    );

    if (!mounted) return;
    if (verified != true) return;

    // Si la verificación es exitosa, mostrar el diálogo de edición
    final result = await showDialog<bool>(
      context: dialogContext,
      builder: (context) => EditUserDialog(
        userId: userId,
        userData: userData,
      ),
    );

    if (!mounted) return;
    if (result == true) {
      ScaffoldMessenger.of(dialogContext).showSnackBar(
        const SnackBar(content: Text('Usuario actualizado correctamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios Registrados'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (mounted) {
              context.go('/dashboard');
            }
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersService.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No hay usuarios registrados'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              final userId = snapshot.data!.docs[index].id;
              final createdById = userData['createdBy'];

              return FutureBuilder<String>(
                future: createdById != null ? _getUserNameById(createdById) : Future.value('Desconocido'),
                builder: (context, createdBySnapshot) {
                  final createdByName = createdBySnapshot.data ?? 'Desconocido';
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(userData['name']?[0] ?? 'U'),
                      ),
                      title: Text(userData['name'] ?? 'Sin nombre'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: ${userData['email'] ?? 'Sin email'}'),
                          Text('Rol: ${userData['role'] ?? 'Sin rol'}'),
                          Text('Creado por: $createdByName'),
                          Text('Fecha de creación: '
                            '${userData['createdAt'] != null ? DateFormat('yyyy-MM-dd HH:mm').format((userData['createdAt'] is String)
                              ? DateTime.parse(userData['createdAt'])
                              : (userData['createdAt'] as Timestamp).toDate()) : 'Desconocida'}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showEditDialog(context, userId, userData),
                        tooltip: 'Editar usuario',
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
} 