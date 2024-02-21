import 'package:flutter/material.dart';

class Inventorydetails with ChangeNotifier {
  final String name;
  final String quantity;
  final String place;

  Inventorydetails({required this.name, required this.quantity, required this.place});
}
