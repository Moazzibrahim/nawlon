import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:provider/provider.dart'; // Import Provider

class LogoutScreen with ChangeNotifier {
  Future<void> logout(BuildContext context) async {
    try {
      final tokenProvider = Provider.of<TokenModel>(context, listen: false);
      final token = tokenProvider.token;

      final response = await http.post(
        Uri.parse('https://login.nawlon.org/api/api_login/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token', // Use token here
        },
      );

      if (response.statusCode == 200) {
        log('Logout successful');
        log(response.body);
      } else {
        log('Logout failed');
        log('Status code: ${response.statusCode}');
        log('Response body: ${response.body}');
      }
    } catch (error) {
      log('Error: $error');
    }
  }
}
