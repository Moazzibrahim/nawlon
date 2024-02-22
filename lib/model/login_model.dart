// Import necessary packages
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/dashboard.dart';
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

// Create a class to handle login operations
class LoginModel with ChangeNotifier {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    // API endpoint to authenticate user
    String apiUrl = 'https://yourapi.com/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': emailcontroller.text,
          'password': passController.text,
        }),
      );

      if (response.statusCode == 200) {
        // If authentication is successful, extract token from response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        String token = responseData['token'];

        // Use provider to set the token
        Provider.of<TokenModel>(context, listen: false).setToken(token);

        // Navigate to the dashboard
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
      // Handle any errors that occur during the API call
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occurred while authenticating'),
        ),
      );
    }
  }
}
