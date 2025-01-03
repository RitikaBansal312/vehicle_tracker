// import 'package:get/get.dart';
// import '../models/vehicle_model.dart';
// import '../services/firebase_service.dart';

// class VehicleController extends GetxController {
//   final FirebaseService _firebaseService = FirebaseService();

//   var vehicles =
//       <String, Welcome>{}.obs; // Observable Map for real-time updates

//   @override
//   void onInit() {
//     super.onInit();
//     listenToVehicleUpdates();
//   }

//   void listenToVehicleUpdates() {
//     _firebaseService.getVehiclesStream().listen((event) {
//       final data = event.snapshot.value as Map<dynamic, dynamic>?;
//       if (data != null) {
//         print("data--------------------------------->" + data.toString());
//         final castedData = data.cast<String, dynamic>();
//         castedData.forEach((key, value) {
//           print("key--------------------------------->" + key.toString());
//           print("value---------------------------------------------->" +
//               value.toString());
//           if (castedData[key] != null) {
//             print(castedData[key]);
//             try {
//               Welcome welcomeData = Welcome.fromJson(castedData);
//               vehicles[key] = welcomeData;
//             } catch (e) {
//               print("Error casting value to Map<String, dynamic>: $e");
//             }
//           } else {
//             print("Error: value is null or not a Map<String, dynamic>");
//           }
//           // // Ensure value is not null and is a Map<String, dynamic> before casting
//           // if (value != null) {
//           //   try {
//           //     final Map<String, dynamic> castedMap =
//           //         value as Map<String, dynamic>;
//           //     Welcome welcomeData = Welcome.fromJson(castedMap);
//           //     vehicles[key] = welcomeData;
//           //   } catch (e) {
//           //     print("Error casting value to Map<String, dynamic>: $e");
//           //   }
//           // } else {
//           //   print("Error: value is null or not a Map<String, dynamic>");
//           // }
//         });
//       }
//     });
//   }
// }

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
