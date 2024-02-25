import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/nawlen.dart';
import 'package:http/http.dart' as http;

class NawlenProvider with ChangeNotifier{
  
  Future<List<Nawlen>> getNawlenCar(String? token)async{
    try{
      if(token!=null){
        final response = await http.get(
          Uri.parse(baseUrl),
          headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        );
        if(response.statusCode==200){
          final Map<String,dynamic> responseData= jsonDecode(response.body);
          Nawlens nawlens =Nawlens.fromJson(responseData);
          var nawlensList=nawlens.xx.map((e) => Nawlen.fromJson(e)).toList();
          return nawlensList;
        }else{
          log('status code: ${response.statusCode}');
        
        }
      }else{
        log('token is null');
        }
    }catch(e){
      log('Error: $e');
    }
    throw Exception('Failed to load nawlen');
  }


}