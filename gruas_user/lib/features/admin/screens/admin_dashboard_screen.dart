import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:gruas_user/features/auth/providers/auth_provider.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Administración'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await context.read<AuthProvider>().signOut();
              if (context.mounted) {
                context.go('/login');
              }
            },
          ),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildDashboardCard(
            context,
            'Usuarios',
            Icons.people,
            () {
              // TODO: Implementar navegación a gestión de usuarios
            },
          ),
          _buildDashboardCard(
            context,
            'Trabajadores',
            Icons.engineering,
            () {
              // TODO: Implementar navegación a gestión de trabajadores
            },
          ),
          _buildDashboardCard(
            context,
            'Grúas',
            Icons.local_shipping,
            () {
              // TODO: Implementar navegación a gestión de grúas
            },
          ),
          _buildDashboardCard(
            context,
            'Servicios',
            Icons.assignment,
            () {
              // TODO: Implementar navegación a gestión de servicios
            },
          ),
          _buildDashboardCard(
            context,
            'Reportes',
            Icons.bar_chart,
            () {
              // TODO: Implementar navegación a reportes
            },
          ),
          _buildDashboardCard(
            context,
            'Configuración',
            Icons.settings,
            () {
              // TODO: Implementar navegación a configuración
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 