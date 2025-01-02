class Vehicle {
  final String id;
  final String name;
  final String icon;
  final double latitude;
  final double longitude;

  Vehicle({
    required this.id,
    required this.name,
    required this.icon,
    required this.latitude,
    required this.longitude,
  });

  factory Vehicle.fromMap(String id, Map<dynamic, dynamic> data) {
    return Vehicle(
      id: id,
      name: data['name'] ?? '',
      icon: data['icon'] ?? '',
      latitude: data['coordinate']['latitude']?.toDouble() ?? 0.0,
      longitude: data['coordinate']['longitude']?.toDouble() ?? 0.0,
    );
  }
}
