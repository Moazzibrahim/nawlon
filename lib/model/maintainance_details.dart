import 'package:flutter/material.dart';

class Maintainancedetails with ChangeNotifier {
  final String name;
  final DateTime? date; // Changed type to DateTime
  final int price;
  final String discription;
  final int id;
  final String carType;
  final String brand;
  // final String servicesTitle;
  // final int servicesPrice;
  // final String carPartsName;

  Maintainancedetails({
    required this.name,
    this.date,
    required this.price,
    required this.discription,
    required this.id,
    required this.carType,
    required this.brand,
    // required this.servicesTitle,
    // required this.servicesPrice,
    // required this.carPartsName
  });

  factory Maintainancedetails.fromJson(Map<String, dynamic> json) {
    List<dynamic> maintenanceList = json['0']['maintanence'];

    if (maintenanceList.isNotEmpty) {
      // Parsing the first maintenance entry
      var firstMaintenance = maintenanceList[1];
      return Maintainancedetails(
        name: firstMaintenance['car']['cars_name'],
        date: DateTime.parse(
            firstMaintenance['created_at']), // Parsing date string
        price: firstMaintenance['maintenances_price'],
        discription: firstMaintenance['description'],
        id: firstMaintenance['id'],
        carType: firstMaintenance['car']['car_type'],
        brand: firstMaintenance['car']['brand'],
        // servicesTitle: firstMaintenance['sevices_maintanenc']['servicesTitle'],
        // servicesPrice: firstMaintenance['sevices_maintanenc']['servicesPrice'],
        // carPartsName: firstMaintenance['car_parts']['name'],
      );
    } else {
      // Handling the case when no maintenance data is available
      return Maintainancedetails(
          name: '',
          price: 0,
          discription: '',
          id: 0,
          carType: '',
          brand: '',
          // servicesTitle: '',
          // servicesPrice: 0,
          // carPartsName: ''
          );
    }
  }
}
