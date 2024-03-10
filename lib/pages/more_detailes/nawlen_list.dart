import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NawlenList extends StatelessWidget {
  const NawlenList({
    Key? key,
    this.title,
    required this.nawlenValue,
    required this.tatekLocation,
    required this.tahmelLocation,
    required this.carName,
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
            elevation: 2,
            margin: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 10.w
              ),
            color: cardBackgroundColor,
            child: Table(
              defaultColumnWidth: const FixedColumnWidth(100.0),
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        color: cardBackgroundColor,
                        height: 100,
                        width: 100,
                        child: const Center(child: Text('قيمة الناولون')),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: cardBackgroundColor,
                        height: 100,
                        width: 100,
                        child: const Center(child: Text('السيارة')),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: cardBackgroundColor,
                        height: 100,
                        width: 100,
                        child: const Center(child: Text('مكان التحميل')),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: cardBackgroundColor,
                        height: 100,
                        width: 100,
                        child: const Center(child: Text('مكان التعتيق')),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        color: cardBackgroundColor,
                        height: 100,
                        width: 100,
                        child: Center(
                            child: Text(
                          nawlenValue.toString(),
                          style: const TextStyle(color: Colors.deepOrange),
                        )),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: cardBackgroundColor,
                        height: 100,
                        width: 100,
                        child: Center(
                            child: Text(
                          carName[index],
                          style: const TextStyle(color: Colors.deepOrange),
                        )),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: cardBackgroundColor,
                        height: 100,
                        width: 100,
                        child: Center(
                            child: Text(
                          tahmelLocation[index],
                          style: const TextStyle(color: Colors.deepOrange),
                        )),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: cardBackgroundColor,
                        height: 100,
                        width: 100,
                        child: Center(
                            child: Text(
                          tatekLocation[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.deepOrange),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
