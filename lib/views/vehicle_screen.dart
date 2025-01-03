import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/vehicle_controller.dart';

class VehicleMapPage extends StatelessWidget {
  VehicleMapPage({super.key});

  final VehicleController vehicleController = Get.put(VehicleController());
  BitmapDescriptor? _customIcon;

  /// Load custom marker from assets
  Future<void> _loadCustomMarker() async {
    try {
      final BitmapDescriptor customIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(35, 35)), // Adjust marker size
        'assets/marker.png',
      );

      _customIcon = customIcon;
    } catch (e) {
      debugPrint("Error loading custom marker: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadCustomMarker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-time Vehicle Tracking'),
      ),
      body: Obx(
        () {
          if (vehicleController.vehicles.isEmpty) {
            return const Center(child: Text("No vehicles found."));
          }

          return GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(28.699774, 77.138596), // Default location
              zoom: 12,
            ),
            markers:
                // {
                // Marker(
                //   markerId: MarkerId('test_marker'),
                //   position: LatLng(12.971598, 77.594566),
                //   infoWindow: InfoWindow(title: 'Test Marker'),
                // ),
                // ...
                vehicleController.vehicles.entries.map((entry) {
              final vehicle = entry.value;
              return Marker(
                markerId: MarkerId(entry.key),
                position: LatLng(vehicle.latitude, vehicle.longitude),
                infoWindow: InfoWindow(title: vehicle.name),
                icon: _customIcon ?? BitmapDescriptor.defaultMarker,
              );
            }).toSet(),
            // },
          );
        },
      ),
    );
  }
}
