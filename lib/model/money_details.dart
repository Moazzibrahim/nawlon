import 'package:flutter/material.dart';

class Moneydetails with ChangeNotifier {
  final String name;
  final String money;
  final Color color;

  Moneydetails({required this.name, required this.money, required this.color});
}
