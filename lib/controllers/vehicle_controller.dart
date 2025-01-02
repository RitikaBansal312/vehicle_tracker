import 'package:get/get.dart';
import '../models/vehicle_model.dart';
import '../services/firebase_service.dart';

class VehicleController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  var vehicles =
      <String, Vehicle>{}.obs; // Observable Map for real-time updates

  @override
  void onInit() {
    super.onInit();
    listenToVehicleUpdates();
  }

  void listenToVehicleUpdates() {
    _firebaseService.getVehiclesStream().listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        vehicles.clear();
        data.forEach((key, value) {
          vehicles[key] = Vehicle.fromMap(key, value);
        });
      }
    });
  }
}
