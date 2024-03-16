import 'package:flutter/material.dart';

class Maintainancedetails with ChangeNotifier {
  final String? name;
  final String? date; 
  final int? price;
  final String? discription;
  final int? id;
  final String? carType;
  final String? brand;
  final String? servicesTitle;
  final String? servicesPrice;
  // final String carPartsName;

  Maintainancedetails({
    this.name,
    this.date,
    this.price,
    this.discription,
    this.id,
    this.carType,
    this.brand,
    this.servicesTitle,
    this.servicesPrice,
    // required this.carPartsName
  });

  factory Maintainancedetails.fromJson(Map<String, dynamic> json) {
    List<dynamic> maintenanceList = json['0']['maintanence'];

    if (maintenanceList.isNotEmpty) {
      // Parsing the first maintenance entry
      var firstMaintenance = maintenanceList[1];
      return Maintainancedetails(
        name: firstMaintenance['car']['cars_name'],
        date: firstMaintenance['created_at'], // Parsing date string
        price: firstMaintenance['maintenances_price'],
        discription: firstMaintenance['description'],
        id: firstMaintenance['id'],
        carType: firstMaintenance['car']['car_type'],
        brand: firstMaintenance['car']['brand'],
        servicesTitle: firstMaintenance['sevices_maintanenc']['servicesTitle'],
        servicesPrice: firstMaintenance['sevices_maintanenc']['servicesPrice'],
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
        servicesTitle: '',
        servicesPrice: '',
        // carPartsName: ''
      );
    }
  }
}

class ServicesMaintainnance {
  final String servicesTitle;
  final int servicesPrice;

  ServicesMaintainnance({
    required this.servicesTitle,
    required this.servicesPrice,
  });

  factory ServicesMaintainnance.fromJson(Map<String, dynamic> json) =>
      ServicesMaintainnance(
        servicesTitle: json['servicesTitle'],
        servicesPrice: json['servicesPrice'],
      );
}

class ServicesMaintainnanceList {
  final List<dynamic> servicesMaintainnanceList;

  ServicesMaintainnanceList({required this.servicesMaintainnanceList});

  factory ServicesMaintainnanceList.fromJson(Map<String, dynamic> json) =>
      ServicesMaintainnanceList(
        servicesMaintainnanceList: json['1']['maintanenceSevices'],
      );
}
