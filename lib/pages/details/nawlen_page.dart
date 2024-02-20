import 'package:flutter/material.dart';
import 'package:flutter_dashboard/pages/details/widgets/grid_nawlen_details.dart';

class NawlenPage extends StatelessWidget {
  const NawlenPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 23, 24, 33),
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(12.0),
        child:  GridNawlen(),
      ),
    );
  }
}