// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/dashboard.dart';
import 'package:http/http.dart' as http;

class LoginModel with ChangeNotifier {
  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    // API endpoint to authenticate user
    String apiUrl = 'https://yourapi.com/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // Authentication successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
      } else {
        // Authentication failed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Authentication failed'),
          ),
        );
      }
    } catch (error) {
      log('Error: $error');
      // Handle any errors that occur during the API call
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occurred while authenticating'),
        ),
      );
    }
  }
}
