import 'package:flutter/material.dart';

class Maintainancedetails with ChangeNotifier {
  final String? name;
  final String? date; 
  final int? price;
  final int totalServicesPrice;
  final String? discription;
  final int? id;
  final String? carType;
  final String? brand;
  final List<ServicesMaintainnance> servicesMaintainnance;
  final List<CarParts> carParts;
  

  Maintainancedetails({
    this.name,
    this.date,
    this.price,
    this.discription,
    this.id,
    this.carType,
    this.brand,
    required this.totalServicesPrice,
    required this.servicesMaintainnance,
    required this.carParts,
    
  });

  factory Maintainancedetails.fromJson(Map<String, dynamic> json) {
    List<ServicesMaintainnance> servicesMaintainanceList = [];
    List<CarParts> carPartsList = [];
    if (json['srevices_maintanenc'] != null) {
      json['srevices_maintanenc'].forEach((v) {
        servicesMaintainanceList.add(ServicesMaintainnance.fromJson(v));
      });
    }
    
    if(json['car_parts']  != null) {
      json['car_parts'].forEach((v){
        carPartsList.add(CarParts.fromJson(v));
      });
    }
    return Maintainancedetails(
      name: json['car']['cars_name'],
      date: json['created_at'],
      price: json['maintenances_price'],
      id: json['id'],
      carType: json['car']['car_type'],
      brand: json['car']['brand'],
      totalServicesPrice: json['totalServicesPrice'],
      discription: json['description'], 
      servicesMaintainnance: servicesMaintainanceList,
      carParts: carPartsList,
    );
  }
}
class MaintainanceList{
  final List<dynamic> maintainanceList;

  MaintainanceList({required this.maintainanceList});
  
  factory MaintainanceList.fromJson(Map<String,dynamic> json)=>
  MaintainanceList(maintainanceList: json['0']['maintanence']);

}
class ServicesMaintainnance {
  final String servicesTitle;
  final String servicesPrice;

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

class CarParts{
  final String name;
  final String code;

  CarParts({required this.name, required this.code});

  factory CarParts.fromJson(Map<String, dynamic> json) =>
      CarParts(name: json['name'], code: json['code']);
  
}
