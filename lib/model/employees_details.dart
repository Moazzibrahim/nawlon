import 'package:flutter/material.dart';

class Employeedetails with ChangeNotifier {
  String? successMessage;
  int? driverAvailable;
  int? driverFollowAvailable;
  int? employeeAvailable;
  String? status;
  Color? color;

  Employeedetails({
    this.successMessage,
    this.driverAvailable,
    this.driverFollowAvailable,
    this.employeeAvailable,
    this.status,
    this.color,
  });

  factory Employeedetails.fromJson(Map<String, dynamic> json) {
    return Employeedetails(
      successMessage: json['success'] ?? "",
      driverAvailable: json['driverAvailable'],
      driverFollowAvailable: json['driverFollowAvailable'],
      employeeAvailable: json['employeeAvailable'],
    );
  }
}
