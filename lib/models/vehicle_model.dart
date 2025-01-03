class Vehicle {
  final String name;
  final String icon;
  final double latitude;
  final double longitude;

  Vehicle({
    required this.name,
    required this.icon,
    required this.latitude,
    required this.longitude,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    final coordinate = Map<String, dynamic>.from(json['coordinate']);
    return Vehicle(
      name: json['name'] ?? 'Unknown',
      icon: json['icon'] ?? '',
      latitude: coordinate['latitude']?.toDouble() ?? 0.0,
      longitude: coordinate['longitude']?.toDouble() ?? 0.0,
    );
  }
}
