import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/vehicle_controller.dart';

class VehicleMapPage extends StatelessWidget {
  final VehicleController vehicleController = Get.put(VehicleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Real-time Vehicle Tracking')),
      body: Obx(() {
        return GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(77.5700919, 77.5700919),
            zoom: 14,
          ),
          markers: vehicleController.vehicles.values.map((vehicle) {
            return Marker(
              markerId: MarkerId(vehicle.id),
              position: LatLng(vehicle.latitude, vehicle.longitude),
              infoWindow: InfoWindow(title: vehicle.name),
              icon: BitmapDescriptor.defaultMarker,
            );
          }).toSet(),
        );
      }),
    );
  }
}

// AIzaSyAzucGXsHD0TnhL0jZA-bc2j0X7SsgCd0s