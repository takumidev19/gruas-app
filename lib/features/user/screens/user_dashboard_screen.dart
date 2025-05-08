import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:gruas/features/auth/providers/auth_provider.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Usuario'),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildServiceRequestCard(context),
          const SizedBox(height: 16),
          _buildActiveServicesCard(context),
          const SizedBox(height: 16),
          _buildHistoryCard(context),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              // TODO: Implementar solicitud de nuevo servicio
            },
            icon: const Icon(Icons.add),
            label: const Text('Nuevo Servicio'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () {
              context.go('/user/map-test');
            },
            icon: const Icon(Icons.map),
            label: const Text('Mapa de Prueba'),
            backgroundColor: Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceRequestCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Solicitar Servicio',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ubicación de recogida',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ubicación de destino',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Descripción del servicio',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implementar envío de solicitud
                },
                child: const Text('Solicitar Servicio'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveServicesCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Servicios Activos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 0, // TODO: Implementar lista de servicios activos
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text('Servicio #123'),
                  subtitle: Text('En progreso'),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Historial de Servicios',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 0, // TODO: Implementar historial de servicios
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text('Servicio #456'),
                  subtitle: Text('Completado'),
                  trailing: Icon(Icons.check_circle),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
} 