import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../models/vehicle_model.dart';
import '../services/firebase_service.dart';

class VehicleController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  var vehicles = <String, Vehicle>{}.obs;

  @override
  void onInit() {
    super.onInit();
    listenToVehicleUpdates();
  }

// listen To Vehicle Updates
  void listenToVehicleUpdates() {
    _firebaseService.getVehiclesStream().listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        debugPrint("Raw Firebase data: $data");
        vehicles.clear();
        data.forEach((key, value) {
          if (value is Map) {
            try {
              // Convert the Firebase map to Map<String, dynamic>
              final vehicleData = Map<String, dynamic>.from(value as Map);
              final vehicle = Vehicle.fromJson(vehicleData);
              debugPrint("Parsed Vehicle for $key: ${vehicle.name}");
              vehicles[key] = vehicle;
            } catch (e) {
              debugPrint("Error parsing vehicle data for $key: $e");
            }
          } else {
            debugPrint("Invalid data format for key $key");
          }
        });
        debugPrint("Total vehicles parsed: ${vehicles.length}");
      } else {
        debugPrint("No data found in Firebase");
      }
    });
  }
}
