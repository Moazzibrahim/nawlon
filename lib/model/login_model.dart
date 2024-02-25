// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

// Create a class to hold the token
class TokenModel with ChangeNotifier {
  late String _token;

  String get token => _token;

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }
}

class LoginModel with ChangeNotifier {
  Future<String> loginUser(
      BuildContext context, String email, String password) async {
    // API endpoint to authenticate user
    String apiUrl = 'https://login.nawlon.org/api/api_login/login';
    http.Response? response; // Define response variable outside try block

    try {
      response = await http.post(
        // Assign response inside try block
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // If authentication is successful, extract token from response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        String token = responseData['token'];

        // Use provider to set the token
        Provider.of<TokenModel>(context, listen: false).setToken(token);
        log("status code: ${response.statusCode}");
        log("Token: $token");
        log("$responseData");

        // Return success message
        return "${responseData["success"]}";
      } else {
        // Authentication failed, return error message
        return "Authentication failed";
      }
    } catch (error) {
      // Handle any errors that occur during the API call
      log('Error occurred: $error');
      log('Response status code: ${response?.statusCode ?? 'Unknown'}'); // Access response variable safely
      log('Response body: ${response?.body ?? 'No response'}'); // Access response variable safely
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occurred while authenticating'),
        ),
      );
      return 'Error occurred while authenticating';
    }
  }
}
