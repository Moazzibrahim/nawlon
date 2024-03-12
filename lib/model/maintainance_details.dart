// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
import 'package:flutter/material.dart';

class Maintainancedetails with ChangeNotifier {
  String? name;
  DateTime? date;
  double? price;
  Maintainancedetails({
    this.name,
    this.date,
    this.price,
  });
  factory Maintainancedetails.fromJson(Map<String, dynamic> json) {
    var carparts = json['0']['maintanence']['car_parts'];
    return Maintainancedetails(
      name: json['0']['maintanence'][0]['car']['cars_name'],
      date: json['0']['maintanence'][0]['created_at'],
      price: json['0']['maintanence'][0]['maintenances_price'],
    );
  }
}
