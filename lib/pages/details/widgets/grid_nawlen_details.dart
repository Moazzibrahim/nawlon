import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/nawlen.dart';
import 'package:flutter_dashboard/pages/more_detailes/nawlen_list.dart';

class GridNawlen extends StatelessWidget {
  GridNawlen({super.key});

  final List<Nawlen> dataNawlen = [
    Nawlen(car: 'nusa', tatekLocation: 'bahary', downLocation: 'sidi beshr',status: 'في الطريق'),
    Nawlen(car: 'zoza', tatekLocation: 'manshia', downLocation: 'sidi gaber',status: 'في الطريق'),
    Nawlen(car: 'aziza', tatekLocation: 'miami', downLocation: 'amrya',status: 'في الطريق'),
    Nawlen(car: 'zoba', tatekLocation: 'moharem beh', downLocation: 'dkhela',status: 'تم الوصول'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 15,
      ),
      children: [
        InkWell(
          onTap: () {
            var x= dataNawlen.where((e) => e.status=='في الطريق').toList();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx)=> NawlenList(title: dataNawlen[0].status, nawlenList: x))
            );
            },
          
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: cardBackgroundColor,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('في الطريق',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: cardBackgroundColor,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('الباقي',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
          ),
        )
      ],
    );
  }
}
