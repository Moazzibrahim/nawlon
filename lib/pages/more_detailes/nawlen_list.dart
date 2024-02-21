// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';

class NawlenList extends StatelessWidget {
  const NawlenList(
      {super.key,
      required this.title,
      required this.nawlenvalue,
      required this.nawlenCars,
      required this.nawlenTatekLocation,
      required this.nawlenDownLocation});
  final String title;
  final List<int> nawlenvalue;
  final List<String> nawlenCars;
  final List<String> nawlenTatekLocation;
  final List<String> nawlenDownLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 23, 24, 33),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: nawlenvalue.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.all(5),
            color: cardBackgroundColor,
            child: ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('قيمة الناولين'),
                  Text('السيارة'),
                  Text('مكان التعتيق'),
                  Text('مكان التحميل'),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(nawlenvalue[index].toString()),
                  Text(nawlenCars[index]),
                  Text(nawlenTatekLocation[index]),
                  Text(nawlenDownLocation[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
