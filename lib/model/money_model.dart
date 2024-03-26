import 'package:flutter/material.dart';

class Money with ChangeNotifier {
  final int? totRevenue;
  final int? totExpense;
  final int? totProfit;
  final Color? color;
  String? status;

  Money(
      {this.totProfit,
      this.totRevenue,
      this.totExpense,
      this.color,
      this.status});

  factory Money.fromJson(Map<String, dynamic> json) {
    Color? chosenColor =
        Colors.blue; // Initialize chosenColor with some default value
    return Money(
      totRevenue: json['totalRevenue'],
      totExpense: json['totalExpense'],
      totProfit: json['totalProfit'],
      color: chosenColor,
    );
  }
}
