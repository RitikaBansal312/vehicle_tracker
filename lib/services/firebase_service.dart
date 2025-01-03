import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final DatabaseReference _vehicleRef =
      FirebaseDatabase.instance.ref('Vehicles');

  Stream<DatabaseEvent> getVehiclesStream() {
    _vehicleRef.onValue.listen((event) {
      debugPrint("Firebase data: ${event.snapshot.value}");
    });

    return _vehicleRef.onValue;
  }
}
