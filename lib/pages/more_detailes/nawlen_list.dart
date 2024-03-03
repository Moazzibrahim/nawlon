import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';

class NawlenList extends StatelessWidget {
  const NawlenList({
    Key? key,
    this.title,
    required this.nawlenValue, required this.tatekLocation, required this.tahmelLocation, required this.carName,
  }) : super(key: key);

  final String? title;
  final List<int> nawlenValue;
  final List<String> tatekLocation;
  final List<String> tahmelLocation;
  final List<String> carName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
        backgroundColor: const Color.fromARGB(255, 23, 24, 33),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: nawlenValue.length,
        itemBuilder: (context, index) {
          
          return Card(
            elevation: 3,
            margin: const EdgeInsets.all(15),
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
                  Text(nawlenValue[index].toString()), 
                  Text(carName[index]), 
                  Text(tahmelLocation[index]),
                  Text(tatekLocation[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
