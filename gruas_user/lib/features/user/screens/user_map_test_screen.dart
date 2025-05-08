import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class UserMapTestScreen extends StatefulWidget {
  const UserMapTestScreen({Key? key}) : super(key: key);

  @override
  State<UserMapTestScreen> createState() => _UserMapTestScreenState();
}

class _UserMapTestScreenState extends State<UserMapTestScreen> with WidgetsBindingObserver {
  GoogleMapController? _mapController;
  LatLng? _currentLatLng;
  bool _loading = true;
  Set<Marker> _markers = {};
  StreamSubscription<Position>? _positionStreamSubscription;
  bool _mapCreated = false;
  String _mapError = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeMap();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _positionStreamSubscription?.cancel();
    _mapController?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _mapController != null) {
      setState(() {
        _initializeMap();
      });
    }
  }

  Future<void> _initializeMap() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          setState(() {
            _loading = false;
            _mapError = 'Servicios de ubicación desactivados';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Por favor activa los servicios de ubicación')),
          );
        }
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            setState(() {
              _loading = false;
              _mapError = 'Permisos de ubicación denegados';
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Los permisos de ubicación fueron denegados')),
            );
          }
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (mounted) {
          setState(() {
            _loading = false;
            _mapError = 'Permisos de ubicación permanentemente denegados';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Los permisos de ubicación están permanentemente denegados'),
            ),
          );
        }
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      if (mounted) {
        setState(() {
          _currentLatLng = LatLng(position.latitude, position.longitude);
          _markers = {
            Marker(
              markerId: const MarkerId('current_location'),
              position: _currentLatLng!,
              infoWindow: const InfoWindow(title: 'Tu ubicación'),
            ),
          };
          _loading = false;
          _mapError = '';
        });
      }

      _startLocationUpdates();
    } catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _mapError = 'Error al obtener la ubicación: $e';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al obtener la ubicación: $e')),
        );
      }
    }
  }

  void _startLocationUpdates() {
    _positionStreamSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      if (mounted) {
        setState(() {
          _currentLatLng = LatLng(position.latitude, position.longitude);
          _markers = {
            Marker(
              markerId: const MarkerId('current_location'),
              position: _currentLatLng!,
              infoWindow: const InfoWindow(title: 'Tu ubicación'),
            ),
          };
        });
        
        _mapController?.animateCamera(
          CameraUpdate.newLatLng(_currentLatLng!),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    if (_currentLatLng == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No se pudo obtener la ubicación'),
              if (_mapError.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  _mapError,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Mapa de Prueba')),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentLatLng!,
              zoom: 16,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _mapController = controller;
                _mapCreated = true;
                _mapError = '';
              });
            },
            mapToolbarEnabled: true,
            compassEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            mapType: MapType.normal,
          ),
          if (!_mapCreated)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (_mapError.isNotEmpty)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Card(
                color: Colors.red.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _mapError,
                    style: TextStyle(color: Colors.red.shade900),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
} 