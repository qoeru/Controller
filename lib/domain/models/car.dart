import 'dart:convert';

List<Car> userModelFromJson(String str) =>
    List<Car>.from(json.decode(str).map((x) => Car.fromJson(x)));

String userModelToJson(List<Car> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Car {
  final String gos_number;
  final String permit_number; // номер лицензии
  final List<int> drivers;

  int? id;
  String? insurance;
  String? diagnostic_card_front;
  String? diagnostic_card_back;
  int? year;
  String? brand;

  Car(
      {required this.gos_number,
      required this.permit_number,
      required this.drivers});

  Map<String, dynamic> toJson() => {
        "gos_number": gos_number,
        "permit_number": permit_number,
        "drivers": drivers,
      };

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        gos_number: json["gos_number"],
        permit_number: json["permit_number"],
        drivers: json["drivers"],
      );
}
