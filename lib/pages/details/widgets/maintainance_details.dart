// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Maintainancedetails with ChangeNotifier {
  String name;
  String date;
  String money;
  Maintainancedetails({
    required this.name,
    required this.date,
    required this.money,
  });
}
