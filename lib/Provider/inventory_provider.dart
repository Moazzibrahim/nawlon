// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/inventory_details.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class InventoryProvider with ChangeNotifier {
  List<InventoryDetails> allInventory = [];

  Future<void> fetchinventoryData(BuildContext context) async {
    // Fetch car data from API
    String apiUrl = 'https://login.nawlon.org/api/Car/store';
    try {
      final tokenProvider = Provider.of<TokenModel>(context, listen: false);
      final token = tokenProvider.token;
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        // Parse response data
        final responseData = jsonDecode(response.body);
        log("$responseData");
        print("Api is successful");
        final List<dynamic>? data0 = responseData['0'];
        final List<dynamic>? data1 = responseData['1'];
        final List<dynamic>? data2 = responseData['2'];

        if (data0 != null &&
            data0.isNotEmpty &&
            data1 != null &&
            data1.isNotEmpty &&
            data2 != null &&
            data2.isNotEmpty) {
          var carpartname1 = data0[0]['car_part']['name'];
          var carquantity1 = data0[0]['quantity'];
          var carpartname2 = data0[1]['car_part']['name'];
          var carquantity2 = data0[1]['quantity'];
          var carpartname3 = data0[2]['car_part']['name'];
          var carquantity3 = data0[2]['quantity'];
          var carlocation1 = data0[0]['car_part']['location'];
          var carlocation2 = data0[1]['car_part']['location'];
          var carlocation3 = data0[2]['car_part']['location'];

          final List<InventoryDetails> lists = [
            InventoryDetails(
              carpartname: carpartname1,
              quantity: carquantity1,
              carpartlocation: carlocation1,
              color: cardBackgroundColor,
            ),
            InventoryDetails(
              carpartname: carpartname2,
              quantity: carquantity2,
              carpartlocation: carlocation2,
              color: cardBackgroundColor,
            ),
            InventoryDetails(
              carpartname: carpartname3,
              quantity: carquantity3,
              carpartlocation: carlocation3,
              color: cardBackgroundColor,
            ),
          ];
          allInventory = lists;
          // Notify listeners after updating the list
          notifyListeners();
        } else {
          log('No data available in the response');
        }
      } else {
        throw Exception('Failed to load car data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load car data: $error');
    }
  }
}
