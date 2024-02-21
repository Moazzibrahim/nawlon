// ignore_for_file: file_names

import 'package:flutter/material.dart';


class NawlenList extends StatelessWidget {
  const NawlenList({super.key, required this.title, required this.nawlenList});
  final String title;
  final List<String> nawlenList;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor:const Color.fromARGB(255, 23, 24, 33),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: nawlenList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('youssef'),
            subtitle: Text('lolololo'),
          );
        },
      ),
    );
  }
}
