import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';

class NawlenList extends StatelessWidget {
  const NawlenList({
    Key? key,
    this.title,
    this.detailsPinding,
  }) : super(key: key);

  final String? title;
  final List<Map<String, dynamic>>? detailsPinding;

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
        itemCount: detailsPinding?.length ?? 0,
        itemBuilder: (context, index) {
          final detail = detailsPinding![index];
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
                  Text(detail['nawlone_price'].toString()), // Assuming 'nawlone_price' is always present
                  Text(detail['car']?['cars_name'] ?? 'Unknown'), // Safe access to 'cars_name'
                  Text(detail['location_tatek_name'] ?? ''),
                  Text(detail['tatek_location'] ?? ''),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
