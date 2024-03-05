// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:flutter_dashboard/model/employees_details.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Employeeprovider with ChangeNotifier {
  List<Employeedetails> allMaintainance = [];
  Future<void> getMaintainance(BuildContext context) async {
    try {
      final tokenProvider = Provider.of<TokenModel>(context, listen: false);
      final token = tokenProvider.token;
      final response = await http.get(
        Uri.parse('https://login.nawlon.org/api/Car/Worker'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
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
          final int? driverAvailablenew = data0[0]['driverAvillable'];
          final int? driverFollowAvailablenew =
              data1[0]['driverFollowAvailable'];
          final int? employeeAvailablenew = data2[0]['employeeAvailable'];
          final List<Employeedetails> mylist = [
            Employeedetails(
              driverAvailable: driverAvailablenew,
              status: "السائقين:",
              color: cardBackgroundColor,
            ),
            Employeedetails(
              driverFollowAvailable: driverFollowAvailablenew,
              status: "التباعين:",
              color: cardBackgroundColor,
            ),
            Employeedetails(
              employeeAvailable: employeeAvailablenew,
              status: "الموظفين:",
              color: cardBackgroundColor,
            ),
          ];
          allMaintainance = mylist;
          notifyListeners();
        } else {
          log('No data available in the response');
        }
      } else {
        log('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching data: $e');
    }
  }
}
