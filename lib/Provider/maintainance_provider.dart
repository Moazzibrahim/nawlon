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
  List<Maintainancedetails> allServices = [];

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
        print("$responseData");
        print("Api is successful");

        final List<dynamic> data0 = responseData['0']['maintanence'];

        if (data0.isNotEmpty) {
          List<Maintainancedetails> lists = [];
          for (var item in data0) {
            String mainname = item['car']['cars_name'];
            String date = item['created_at']; // Parsing date string
            int price = item['maintenances_price'];
            String dis = item['description'];
            int id = item['id'];
            String carType = item['car']['car_type'];
            String brand = item['car']['brand'];

            lists.add(
              Maintainancedetails(
                date: date,
                name: mainname,
                price: price,
                discription: dis,
                id: id,
                carType: carType,
                brand: brand,
                // servicesTitle: servicesTitle,
                // servicesPrice: servicesPrice,
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

  Future<void> getServicesMaintainance(BuildContext context) async {
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
        log('services Maintainance data is fetched');
        final responseData = jsonDecode(response.body);
        final List<dynamic> data1 = responseData['1']['maintanenceSevices'];
        if (data1.isNotEmpty) {
          List<Maintainancedetails> list2 = [];
          for (var element in data1) {
            String servicetitle = element['servicesTitle'];
            String serviceprice = element['servicesPrice'];
            list2.add(Maintainancedetails(
              servicesPrice: serviceprice,
              servicesTitle: servicetitle,
            ));
          }
          allServices = list2;
          notifyListeners();
        }

        notifyListeners();
      } else {
        log('status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error on fetching Maintainance: $e');
    }
  }
}
