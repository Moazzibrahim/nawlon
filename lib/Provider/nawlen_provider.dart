import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/nawlen.dart';
import 'package:http/http.dart' as http;

class NawlenProvider with ChangeNotifier {
  Future<List<DetailsPinding>> getDetailsPinding(String? token) async {
    try {
      if (token != null) {
        final response = await http.get(
          Uri.parse('${baseUrl}Car/dataNawlon'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
        );
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          log("$responseData");
          DetailsPindingList dbl = DetailsPindingList.fromJson(responseData);
          var l = dbl.dpl.map((e) => DetailsPinding.fromJson(e)).toList();
          // log("$l");
          return l;
        } else {
          log('status code: ${response.statusCode}');
        }
      } else {
        log('token is null');
      }
    } catch (e) {
      log('Error: $e');
    }
    throw Exception('Failed to load nawlen');
  }

  Future<Nawlen> getNawlenData(String? token) async {
    try {
      if (token != null) {
        final response = await http.get(
          Uri.parse('${baseUrl}Car/dataNawlon'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
        );
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          Nawlen nawlen = Nawlen.fromJson(responseData);
          log("$nawlen");
          return nawlen;
        } else {
          log('status code: ${response.statusCode}');
        }
      } else {
        log('token is null');
      }
    } catch (e) {
      log('Error: $e');
    }
    throw Exception('Failed to load nawlen');
  }
}
