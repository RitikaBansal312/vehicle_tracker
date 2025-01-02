import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _vehicleRef =
      FirebaseDatabase.instance.ref('Vehicles');

  Stream<DatabaseEvent> getVehiclesStream() {
    return _vehicleRef.onValue;
  }
}
