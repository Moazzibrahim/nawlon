// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:flutter_dashboard/model/money_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class MoneyProvider with ChangeNotifier {
  List<Money> moneyList = [];

  Future<void> getMoney(BuildContext context) async {
    String apiUrl = 'https://login.nawlon.org/api/Car/profit';
    try {
      final tokenProvider = Provider.of<TokenModel>(context, listen: false);
      final token = tokenProvider.token;
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);
        final int totalRev = responseData['totalRevenue'];
        final int totalExp = responseData['totalExpense'];
        final int totalProf = responseData['totalProfit'];
        final List<Money> allMoney = [
          Money(totRevenue: totalRev, color: Colors.green, status: "الايرادات"),
          Money(totExpense: totalExp, color: Colors.red, status: "المصروفات"),
          Money(totProfit: totalProf, color: Colors.grey, status: "المكسب")
        ];
        moneyList = allMoney;
        notifyListeners();
      } else {
        throw Exception('Failed to load money data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load money data: $error');
    }
  }
}
