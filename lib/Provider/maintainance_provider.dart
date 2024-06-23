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
  List<ServicesMaintainnance> allServices = [];
  List<CarParts> allCarParts=[];
  String serviceTitle='';
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
        MaintainanceList ml = MaintainanceList.fromJson(responseData);
        List<Maintainancedetails> l = ml.maintainanceList.map((e) => Maintainancedetails.fromJson(e)).toList();
        for(var e in l){
          allServices = e.servicesMaintainnance;
          for (var e in e.carParts) {allCarParts.add(e);}
        }
        allmaintainance=l;
        notifyListeners();
        log('$allCarParts');
        
      } else {
        throw Exception(
            'Failed to load maintainance data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error:$e');
    }
  }

}
