// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Employees with ChangeNotifier {
  final String name;
  final String num;
  final String salary;
  final Image img;
  Employees(
      {required this.name,
      required this.num,
      required this.salary,
      required this.img});
}
