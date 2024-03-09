import 'package:flutter/material.dart';

class InventoryDetails with ChangeNotifier {
  int? id;
  int? carPartId;
  double? totalPrice;
  double? carPartPrice;
  int? quantity;
  String? carpartname;
  String? carpartlocation;
  String? status;
  Color? color;

  InventoryDetails(
      {this.id,
      this.carPartId,
      this.totalPrice,
      this.carPartPrice,
      this.quantity,
      this.carpartname,
      this.carpartlocation,
      this.status,
      this.color});

  factory InventoryDetails.fromJson(Map<String, dynamic> json) {
    return InventoryDetails(
      id: json['id'],
      carPartId: json['car_part_id'],
      totalPrice: json['totalPrice'].toDouble(),
      carPartPrice: json['car_part_price'].toDouble(),
      quantity: json['quantity'],
      carpartlocation:json['car_part']['location'],
      carpartname: json['car_part']['name'],
    );
  }
}
