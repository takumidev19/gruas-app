import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:gruas/features/auth/providers/auth_provider.dart';

class WorkerDashboardScreen extends StatelessWidget {
  const WorkerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Trabajador'),
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
          _buildStatusCard(context),
          const SizedBox(height: 16),
          _buildActiveServiceCard(context),
          const SizedBox(height: 16),
          _buildTodayServicesCard(context),
        ],
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Estado Actual',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 16,
                ),
                const SizedBox(width: 8),
                const Text('Disponible'),
                const Spacer(),
                Switch(
                  value: true, // TODO: Implementar estado de disponibilidad
                  onChanged: (value) {
                    // TODO: Implementar cambio de estado
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveServiceCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Servicio Activo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Ubicación de recogida'),
              subtitle: Text('Calle Principal #123'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Ubicación de destino'),
              subtitle: Text('Avenida Central #456'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implementar inicio de servicio
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Iniciar'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implementar finalización de servicio
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Finalizar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayServicesCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Servicios del Día',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 0, // TODO: Implementar lista de servicios del día
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text('Servicio #789'),
                  subtitle: Text('Programado para 14:00'),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
} 