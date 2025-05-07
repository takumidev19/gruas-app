import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:gruas/features/auth/providers/auth_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform, TargetPlatform;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _resetEmailController = TextEditingController(); // Para el diálogo de reseteo
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _resetEmailController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        await context.read<AuthProvider>().signIn(
          _emailController.text.trim(),
          _passwordController.text,
        );
        if (mounted) {
          final authProvider = context.read<AuthProvider>();
          final role = authProvider.userRole;
          // Redirección basada en rol
          switch (role) {
            case UserRole.admin:
              context.go('/admin/dashboard');
              break;
            case UserRole.user:
              context.go('/user/dashboard');
              break;
            case UserRole.worker:
              context.go('/worker/dashboard');
              break;
            default:
              // Si no hay rol (o es null) pero está autenticado y es admin (primer inicio), ir a admin dashboard
              if (authProvider.isAuthenticated && defaultTargetPlatform == TargetPlatform.windows) {
                context.go('/admin/dashboard');
              } else {
                 context.go('/login'); // Fallback a login por si acaso
              }
              break;
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  Future<void> _handlePasswordReset() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Restablecer Contraseña'),
          content: TextField(
            controller: _resetEmailController,
            decoration: const InputDecoration(labelText: 'Correo electrónico'),
            keyboardType: TextInputType.emailAddress,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_resetEmailController.text.isNotEmpty) {
                  try {
                    await context.read<AuthProvider>().sendPasswordResetEmail(_resetEmailController.text.trim());
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Correo de restablecimiento enviado.')),
                    );
                  } catch (e) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                  }
                }
              },
              child: const Text('Enviar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final bool isWindows = defaultTargetPlatform == TargetPlatform.windows;
    final bool showRegisterButton = kIsWeb || (isWindows && !authProvider.adminExists);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su correo electrónico';
                    }
                    if (!value.contains('@')) {
                        return 'Por favor ingrese un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Iniciar Sesión'),
                ),
                const SizedBox(height: 16),
                if (showRegisterButton)
                  TextButton(
                    onPressed: () => context.go('/register'),
                    child: const Text('¿No tienes una cuenta? Regístrate'),
                  ),
                if (!kIsWeb && isWindows && authProvider.adminExists)
                  TextButton(
                    onPressed: _handlePasswordReset,
                    child: const Text('¿Olvidaste tus datos de administrador?'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 