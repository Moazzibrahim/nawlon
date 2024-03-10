import 'package:flutter/material.dart';

class InventoryDetails with ChangeNotifier {
  int? id;
  int? carPartId;
  double? totalPrice;
  int? quantity;
  String? carpartname;
  String? carpartlocation;
  String? carPartName;
  String? carPartLocation;
  String? carPartCode;
  Color? color;

  InventoryDetails({
    this.id,
    this.carPartId,
    this.totalPrice,
    this.quantity,
    this.carpartname,
    this.carpartlocation,
    this.carPartName,
    this.carPartLocation,
    this.carPartCode,
    this.color,
  });

  factory InventoryDetails.fromJson(Map<String, dynamic> json) {
    var carPart = json['0']['storeNawlon'][0]['car_part'];
    return InventoryDetails(
      id: json['0']['storeNawlon'][0]['id'],
      carPartId: json['0']['storeNawlon'][0]['car_part_id'],
      totalPrice: json['0']['storeNawlon'][0]['totalPrice'].toDouble(),
      quantity: json['0']['storeNawlon'][0]['quantity'],
      carpartname: carPart['name'],
      carpartlocation: carPart['location'],
      carPartName: carPart['name'],
      carPartLocation: carPart['location'],
      carPartCode: carPart['code'],
    );
  }
}
