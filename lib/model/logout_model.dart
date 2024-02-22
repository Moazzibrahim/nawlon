// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

// ignore: must_be_immutable
class Logoutscreen extends StatefulWidget {
  Logoutscreen({super.key});
  String? tokens;

  @override
  State<Logoutscreen> createState() => _LogoutscreenState();
}

class _LogoutscreenState extends State<Logoutscreen> {
  TextEditingController tokincontroller = TextEditingController();

  Future<void> fetchAuthToken() async {
    try {
      // Print the token value
      final response = await http.post(
        Uri.parse('http://192.168.1.4/elmanhag_api/api/api_login/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${widget.tokens}',
        },
        body: jsonEncode({'token': tokincontroller.text}),
      );

      log('Fetch Token Response: ${response.statusCode}');
      log('Fetch Token Response Body: ${response.body}');

      if (response.statusCode == 200) {
        // Parse the response body to extract the token if needed
        final Map<String, dynamic> responseData = json.decode(response.body);
        final Map<String, dynamic> user = responseData['token'];
        final String? newAuthToken = user['token'];
        // Update the authToken variable with the new token
        setState(() {
          widget.tokens = newAuthToken;
        });
        // Remove the authToken assignment if not needed for logout
        // ...
      } else {
        // Handle the case when fetching token fails
        log('Failed to fetch authentication token');
        // ignore: avoid_print
        print(widget.tokens);
      }
    } catch (error) {
      // Handle network errors or other exceptions
      log('Error: $error');
    }
  }

  Future<void> logout() async {
    try {
      if (widget.tokens != null) {
        final response = await http.post(
          Uri.parse('http://192.168.1.4/elmanhag_api/api/api_login/logout'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.tokens}',
          },
        );

        if (response.statusCode == 200) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const LoginScreen())),
          );
          // Successful logout, handle the response data here
          log('Logout successful');
          log(response.body);
          // Add your navigation logic here if needed
        } else {
          // Logout failed, handle the error
          log('Logout failed');
          log('Status code: ${response.statusCode}');
          log('Response body: ${response.body}');
        }
      } else {
        log('authToken is null');
      }
    } catch (error) {
      // Handle network errors or other exceptions
      log('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
