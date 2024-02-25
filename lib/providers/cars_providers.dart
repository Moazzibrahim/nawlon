import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/cars.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class CarsProvider with ChangeNotifier {
  List<Cars> carsData = [];

  Future<void> fetchCarsData(String id,BuildContext context) async {
    // Fetch car data from API
    String apiUrl = '/$id'; // Replace with your API endpoint
    try {
      final tokenProvider = Provider.of<TokenModel>(context,listen: false);
      final token = tokenProvider.token;
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        // Parse response data
        final List<dynamic> responseData = jsonDecode(response.body);
        carsData = responseData.map((data) => Cars.fromJson(data)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load car data');
      }
    } catch (error) {
      throw Exception('Failed to load car data: $error');
    }
  }
}
