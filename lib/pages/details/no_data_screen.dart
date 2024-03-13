import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(title),
        backgroundColor: const Color.fromARGB(255, 23, 24, 33),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.hourglass_empty_rounded,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            const Text(
              'لا يوجد معلومات حتى الان',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cardBackgroundColor,
              ),
              child: const Text('الى الخلف',style: TextStyle(
                color: Colors.deepOrange
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
