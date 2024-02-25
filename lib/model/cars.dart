import 'package:flutter/material.dart';

class Cars {
  final int num;
  final String status;
  final Color color;

  Cars({
    required this.num,
    required this.status,
    required this.color,
  });

  // Factory constructor to parse JSON data
  factory Cars.fromJson(Map<String, dynamic> json) {
    // Here you can choose the color based on the status or any other logic
    // For example:
    Color chosenColor;
    switch (json['status']) {
      case '0':
        chosenColor = Colors.red;
        break;
      case '1 ':
        chosenColor = Colors.orange;
        break;
      case '2':
        chosenColor = Colors.green;
        break;
      case '4':
        chosenColor = Colors.grey;
        break;
      default:
        chosenColor = Colors.black;
        break;
    }
    return Cars(
      num: json['num'],
      status: json['status'],
      color: chosenColor,
    );
  }
}
