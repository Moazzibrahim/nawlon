// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
import 'package:flutter/material.dart';

class Maintainancedetails with ChangeNotifier {
  String? name;
  String? date;
  int? price;
  Maintainancedetails({
    this.name,
    this.date,
    this.price,
  });
  factory Maintainancedetails.fromJson(Map<String, dynamic> json) {
    List<dynamic> maintenanceList = json['0']['maintenance'];

    if (maintenanceList.isNotEmpty) {
      // Parsing the first maintenance entry
      var firstMaintenance = maintenanceList[0];
      return Maintainancedetails(
        name: firstMaintenance['car']['cars_name'],
        date: firstMaintenance['created_at'],
        price: firstMaintenance['maintenances_price'],
      );
    } else {
      // Handling the case when no maintenance data is available
      return Maintainancedetails();
    }
  }
}
