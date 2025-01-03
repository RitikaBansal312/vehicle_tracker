// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../controllers/vehicle_controller.dart';

// class VehicleMapPage extends StatelessWidget {
//   final VehicleController vehicleController = Get.put(VehicleController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Real-time Vehicle Tracking')),
//       body: Obx(() {
//         return GoogleMap(
//           initialCameraPosition: CameraPosition(
//             target: LatLng(77.5700919, 77.5700919),
//             // zoom: 5,
//           ),
//           myLocationEnabled: true,
//           myLocationButtonEnabled: true,
//           mapType: MapType.normal,
//           markers: vehicleController.vehicles.values.map((vehicle) {
//             return Marker(
//               markerId: MarkerId(vehicle.vehicles.carOne.name),
//               position: LatLng(vehicle.vehicles.carOne.coordinate.latitude,
//                   vehicle.vehicles.carOne.coordinate.longitude),
//               infoWindow: InfoWindow(title: vehicle.vehicles.carOne.name),
//               icon: BitmapDescriptor.defaultMarker,
//             );
//           }).toSet(),
//         );
//       }),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/vehicle_controller.dart';

class VehicleMapPage extends StatelessWidget {
  VehicleMapPage({super.key});

  final VehicleController vehicleController = Get.put(VehicleController());

  @override
  Widget build(BuildContext context) {
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
              target: LatLng(12.971598, 77.594566), // Default location
              zoom: 12,
            ),
            markers: {
              Marker(
                markerId: MarkerId('test_marker'),
                position: LatLng(12.971598, 77.594566),
                infoWindow: InfoWindow(title: 'Test Marker'),
              ),
              ...vehicleController.vehicles.entries.map((entry) {
                final vehicle = entry.value;
                return Marker(
                  markerId: MarkerId(entry.key),
                  position: LatLng(vehicle.latitude, vehicle.longitude),
                  infoWindow: InfoWindow(title: vehicle.name),
                  icon: BitmapDescriptor.defaultMarker,
                );
              }).toSet(),
            },
          );
        },
      ),
    );
  }
}
