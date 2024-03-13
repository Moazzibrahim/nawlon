// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:flutter_dashboard/model/maintainance_details.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Maintainanceprovider with ChangeNotifier {
  List<Maintainancedetails> allmaintainance = [];
  Future<void> getMaintainancedata(BuildContext context) async {
    String apiUrl = 'https://login.nawlon.org/api/Car/maintanence';
    try {
      final tokenProvider = Provider.of<TokenModel>(context, listen: false);
      final token = tokenProvider.token;
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        log("$responseData");
        log("Api is successful");

        final List<dynamic> data0 = responseData['0']['maintanence'];
        if (data0.isNotEmpty) {
          List<Maintainancedetails> lists = [];
          for (var item in data0) {
            String mainname = item['car']['cars_name'];
            String date = item['car']['created_at'];
            int price = item['maintenances_price'];
            lists.add(
              Maintainancedetails(
                date: date,
                name: mainname,
                price: price,
              ),
            );
          }
          // Assign lists to allmaintainance instead of vice versa
          allmaintainance = lists;
          notifyListeners();
        } else {
          log('No data available in the response');
        }
      } else {
        throw Exception(
            'Failed to load maintainance data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error:$e');
    }
  }
}
