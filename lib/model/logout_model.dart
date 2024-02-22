// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/login_screen.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:provider/provider.dart'; // Import Provider

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenModel>(context); // Access TokenModel

    return ElevatedButton(
      onPressed: () async {
        await logout(tokenProvider.token,context); // Call logout function with token
      },
      child: const Text('Logout'),
    );
  }

  Future<void> logout(String? token,BuildContext context) async {
    try {
      if (token != null) {
        final response = await http.post(
          Uri.parse('http://192.168.1.4/elmanhag_api/api/api_login/logout'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token', // Use token here
          },
        );

        if (response.statusCode == 200) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const LoginScreen())),
          );
          log('Logout successful');
          log(response.body);
        } else {
          log('Logout failed');
          log('Status code: ${response.statusCode}');
          log('Response body: ${response.body}');
        }
      } else {
        log('Token is null');
      }
    } catch (error) {
      log('Error: $error');
    }
  }
}
