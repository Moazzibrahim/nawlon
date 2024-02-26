import 'package:flutter/material.dart';

class Cars {
  final int? carBusy;
  final int? carAvailable;
  final int? carInRoad;
  final int? carUnAvailable;
  final Color color;
  final String statusText;

  Cars({
    this.carBusy,
    this.carAvailable,
    this.carInRoad,
    this.carUnAvailable,
    required this.color,
    required this.statusText,
  });

  // Factory constructor to parse response data
  factory Cars.fromJson(Map<String, dynamic> json) {
    // Determine color and status text based on car status
    Color chosenColor;
    String status;
    switch (json['status']) {
      case 0:
        chosenColor = Colors.red;
        status = "معطلة";
        break;
      case 1:
        chosenColor = Colors.green;
        status = "متاحة";
        break;
      case 2:
        chosenColor = Colors.blue;
        status = "في الطريق";
        break;
      case 3:
        chosenColor = Colors.grey;
        status = "غير متاحة";
        break;
      default:
        chosenColor = Colors.black;
        status = "Unknown";
    }

    return Cars(
      carBusy: json['carBusy'],
      carAvailable: json['carAvailable'],
      carInRoad: json['carInRoad'],
      carUnAvailable: json['carUnAvailable'],
      color: chosenColor,
      statusText: status,
    );
  }
}
