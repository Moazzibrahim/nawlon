// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/cars.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class CarsProvider with ChangeNotifier {
  List<Cars> allcars = [];
  List<Cars> carsInroad = [];
  List<Cars> carsbusy = [];
  List<Cars> carsavailable = [];
  List<Cars> carsun = [];

  Future<void> fetchCarsData(String id, BuildContext context) async {
    // Fetch car data from API
    String apiUrl = 'https://login.nawlon.org/api/Car/data';
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
        final Map<String, dynamic> responseData = json.decode(response.body);
        print(responseData);

        // Extract individual car details from the response
        final int? carBusy = responseData['0']?['carBusy'];
        final int? carAvailable = responseData['1']?['carAvailable'];
        final int? carInRoad = responseData['2']?['carInRoad'];
        final int? carUnAvailable = responseData['3']?['carUnAvailable'];

        // Construct Cars objects based on the extracted details
        final List<Cars> carsList = [
          Cars(carBusy: carBusy ?? 0, color: Colors.red, statusText: 'معطلة'),
          Cars(
              carAvailable: carAvailable ?? 0,
              color: Colors.green,
              statusText: 'متاحة'),
          Cars(
              carInRoad: carInRoad ?? 0,
              color: Colors.blue,
              statusText: 'في الطريق'),
          Cars(
              carUnAvailable: carUnAvailable ?? 0,
              color: Colors.grey,
              statusText: 'غير متاحة'),
        ];
        // Update the class-level carsData property
        carsbusy =
            carsList.where((e) => e.statusText.contains('معطلة')).toList();
        carsInroad =
            carsList.where((e) => e.statusText.contains('في الطريق')).toList();
        carsavailable =
            carsList.where((e) => e.statusText.contains('متاحة')).toList();
        carsun =
            carsList.where((e) => e.statusText.contains('غير متاحة')).toList();

      //  allcars = [...carsbusy, ...carsInroad, ...carsavailable, ...carsavailable];
        //log("$allcars");
        notifyListeners();
      } else {
        throw Exception('Failed to load car data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load car data: $error');
    }
  }
}
