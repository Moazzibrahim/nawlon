// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/nawlen.dart';

class NawlenList extends StatelessWidget {
  const NawlenList({super.key, required this.title, required this.nawlenList});
  final String title;
  final List<Nawlen> nawlenList;

  void debug(){
    log('$nawlenList');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor:const Color.fromARGB(255, 23, 24, 33),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            debug();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: nawlenList.length,
        itemBuilder: (context, index) {
          return Column(
            children: nawlenList.map((e) => Text(e.status)).toList(),
          );
        },
      ),
    );
  }
}
