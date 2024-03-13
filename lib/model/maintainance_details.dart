import 'package:flutter/material.dart';

class Maintainancedetails with ChangeNotifier {
  String? name;
  DateTime? date; // Changed type to DateTime
  int? price;
  
  Maintainancedetails({
    this.name,
    this.date,
    this.price,
  });

  factory Maintainancedetails.fromJson(Map<String, dynamic> json) {
    List<dynamic> maintenanceList = json['0']['maintanence'];

    if (maintenanceList.isNotEmpty) {
      // Parsing the first maintenance entry
      var firstMaintenance = maintenanceList[0];
      return Maintainancedetails(
        name: firstMaintenance['car']['cars_name'],
        date: DateTime.parse(firstMaintenance['created_at']), // Parsing date string
        price: firstMaintenance['maintenances_price'],
      );
    } else {
      // Handling the case when no maintenance data is available
      return Maintainancedetails();
    }
  }
}
