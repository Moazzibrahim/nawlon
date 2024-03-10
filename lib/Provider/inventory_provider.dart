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
        final List<dynamic>? data0 = responseData['0']['storeNawlon'];

        if (data0 != null && data0.isNotEmpty) {
          List<InventoryDetails> lists = [];

          for (var item in data0) {
            // Calculate price per item
            double totalPrice = double.parse(item['totalPrice'].toString());
            int quantity = item['quantity'];
            double pricePerItem = totalPrice / quantity;

            // Creating InventoryDetails object for each item
            lists.add(
              InventoryDetails(
                id: item['id'],
                carPartId: item['car_part_id'],
                totalPrice: totalPrice,
                quantity: quantity,
                pricePerItem: pricePerItem, // Assigning the calculated price per item
                carpartname: item['car_part']['name'],
                carpartlocation: item['car_part']['location'],
                color: cardBackgroundColor,
              ),
            );
          }

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
