// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

List<DashboardModel> dashboardModelFromJson(String str) => List<DashboardModel>.from(json.decode(str).map((x) => DashboardModel.fromJson(x)));

String dashboardModelToJson(List<DashboardModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DashboardModel {
  String uniqueId;
  double latitude;
  double longitude;
  String locationName;
  int speed;
  double distance;
  bool powerOn;
  bool valid;
  DateTime serverTime;
  DateTime deviceTime;
  int extBatteryVoltage;
  Attributes attributes;

  DashboardModel({
    required this.uniqueId,
    required this.latitude,
    required this.longitude,
    required this.locationName,
    required this.speed,
    required this.distance,
    required this.powerOn,
    required this.valid,
    required this.serverTime,
    required this.deviceTime,
    required this.extBatteryVoltage,
    required this.attributes,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    uniqueId: json["UniqueId"],
    latitude: json["Latitude"]?.toDouble(),
    longitude: json["Longitude"]?.toDouble(),
    locationName: '',
    speed: json["Speed"],
    distance: json["Distance"],
    powerOn: json["PowerOn"],
    valid: json["Valid"],
    serverTime: DateTime.parse(json["ServerTime"]),
    deviceTime: DateTime.parse(json["DeviceTime"]),
    extBatteryVoltage: json["ExtBatteryVoltage"],
    attributes: Attributes.fromJson(json["Attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "UniqueId": uniqueId,
    "Latitude": latitude,
    "Longitude": longitude,
    "Speed": speed,
    "Distance": distance,
    "PowerOn": powerOn,
    "Valid": valid,
    "ServerTime": serverTime.toIso8601String(),
    "DeviceTime": deviceTime.toIso8601String(),
    "ExtBatteryVoltage": extBatteryVoltage,
    "Attributes": attributes.toJson(),
  };
}

class Attributes {
  Attributes();

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
  );

  Map<String, dynamic> toJson() => {
  };
}
