// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//   Vehicles vehicles;

//   Welcome({
//     required this.vehicles,
//   });

//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         vehicles: Vehicles.fromJson(json["Vehicles"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "Vehicles": vehicles.toJson(),
//       };
// }

// class Vehicles {
//   Car carOne;
//   Car carTwo;

//   Vehicles({
//     required this.carOne,
//     required this.carTwo,
//   });

//   factory Vehicles.fromJson(Map<String, dynamic> json) => Vehicles(
//         carOne: Car.fromJson(json["CarOne"]),
//         carTwo: Car.fromJson(json["CarTwo"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "CarOne": carOne.toJson(),
//         "CarTwo": carTwo.toJson(),
//       };
// }

// class Car {
//   Coordinate coordinate;
//   String icon;
//   String name;

//   Car({
//     required this.coordinate,
//     required this.icon,
//     required this.name,
//   });

//   factory Car.fromJson(Map<String, dynamic> json) => Car(
//         coordinate: Coordinate.fromJson(json["coordinate"]),
//         icon: json["icon"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "coordinate": coordinate.toJson(),
//         "icon": icon,
//         "name": name,
//       };
// }

// class Coordinate {
//   double latitude;
//   double longitude;

//   Coordinate({
//     required this.latitude,
//     required this.longitude,
//   });

//   factory Coordinate.fromJson(Map<String, dynamic> json) => Coordinate(
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "latitude": latitude,
//         "longitude": longitude,
//       };
// }

// // class Vehicle {
// //   final String id;
// //   final String name;
// //   final String icon;
// //   final double latitude;
// //   final double longitude;

// //   Vehicle({
// //     required this.id,
// //     required this.name,
// //     required this.icon,
// //     required this.latitude,
// //     required this.longitude,
// //   });

// //   factory Vehicle.fromMap(String id, Map<dynamic, dynamic> data) {
// //     return Vehicle(
// //       id: id,
// //       name: data['name'] ?? '',
// //       icon: data['icon'] ?? '',
// //       latitude: data['coordinate']['latitude']?.toDouble() ?? 0.0,
// //       longitude: data['coordinate']['longitude']?.toDouble() ?? 0.0,
// //     );
// //   }
// // }

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
