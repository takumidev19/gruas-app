import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:gruas_user/features/auth/providers/auth_provider.dart';

class WorkerDashboardScreen extends StatefulWidget {
  const WorkerDashboardScreen({super.key});

  @override
  State<WorkerDashboardScreen> createState() => _WorkerDashboardScreenState();
}

class _WorkerDashboardScreenState extends State<WorkerDashboardScreen> {
  bool _isAvailable = true;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAvailabilityCard(context),
            const SizedBox(height: 16),
            _buildActiveServiceCard(context),
            const SizedBox(height: 16),
            _buildDailyServicesCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailabilityCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Estado de Disponibilidad',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _isAvailable ? 'Disponible' : 'No Disponible',
                    style: TextStyle(
                      color: _isAvailable ? Colors.green : Colors.red,
                      fontSize: 18,
                    ),
                  ),
                ),
                Switch(
                  value: _isAvailable,
                  onChanged: (value) {
                    setState(() {
                      _isAvailable = value;
                    });
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
            // TODO: Implementar estado de disponibilidad
            const Center(
              child: Text('No hay servicio activo'),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implementar inicio de servicio
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Iniciar'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implementar finalización de servicio
                  },
                  icon: const Icon(Icons.stop),
                  label: const Text('Finalizar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyServicesCard(BuildContext context) {
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
            // TODO: Implementar lista de servicios del día
            const Center(
              child: Text('No hay servicios programados'),
            ),
          ],
        ),
      ),
    );
  }
} 