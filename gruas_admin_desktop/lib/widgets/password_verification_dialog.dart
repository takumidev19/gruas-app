import 'package:flutter/material.dart';
import '../services/users_service.dart';

class PasswordVerificationDialog extends StatefulWidget {
  final Function() onVerified;

  const PasswordVerificationDialog({
    super.key,
    required this.onVerified,
  });

  @override
  State<PasswordVerificationDialog> createState() => _PasswordVerificationDialogState();
}

class _PasswordVerificationDialogState extends State<PasswordVerificationDialog> {
  final _passwordController = TextEditingController();
  final _usersService = UsersService();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _verifyPassword() async {
    print('Iniciando verificación...');
    if (_passwordController.text.isEmpty) {
      setState(() => _errorMessage = 'Por favor ingrese su contraseña');
      print('Contraseña vacía');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      print('Llamando a verificación de contraseña por API REST...');
      final user = _usersService.currentUser;
      if (user == null) throw Exception('No hay usuario autenticado');
      final isValid = await _usersService.verifyPasswordWithApi(user.email!, _passwordController.text);
      print('Resultado de verificación: $isValid');
      if (isValid) {
        if (mounted) {
          Navigator.of(context).pop();
          widget.onVerified();
        }
      } else {
        setState(() => _errorMessage = 'Contraseña incorrecta');
      }
    } catch (e) {
      print('Excepción capturada en el diálogo: $e');
      setState(() => _errorMessage = 'Error: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
      print('Finalizó _verifyPassword');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Verificación de Seguridad'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Por favor ingrese su contraseña para continuar',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _verifyPassword(),
          ),
          if (_errorMessage != null) ...[
            const SizedBox(height: 8),
            Text(
              _errorMessage!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: _isLoading ? null : _verifyPassword,
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Verificar'),
        ),
      ],
    );
  }
} 