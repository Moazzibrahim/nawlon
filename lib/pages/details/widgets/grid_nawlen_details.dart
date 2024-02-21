import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/nawlen.dart';
import 'package:flutter_dashboard/pages/more_detailes/nawlen_list.dart';

class GridNawlen extends StatefulWidget {
  const GridNawlen({super.key});

  @override
  State<GridNawlen> createState() => _GridNawlenState();
}

class _GridNawlenState extends State<GridNawlen> {
  final List<Nawlen> dataNawlen = [
    Nawlen(car: 'nusa', tatekLocation: 'bahary', downLocation: 'sidi beshr',status: 'في الطريق'),
    Nawlen(car: 'zoza', tatekLocation: 'manshia', downLocation: 'sidi gaber',status: 'في الطريق'),
    Nawlen(car: 'aziza', tatekLocation: 'miami', downLocation: 'amrya',status: 'في الطريق'),
    Nawlen(car: 'zoba', tatekLocation: 'moharem beh', downLocation: 'dkhela',status: 'تم الوصول'),
  ];
  List<String> x=[];
  List<String> y=[];

  @override
  void initState() {
    x= dataNawlen.map((e) => e.status).toList();
    x= x.where((e) => e=='في الطريق').toList();
    y= dataNawlen.map((e) => e.status).toList();
    y=y.where((e) => e=='تم الوصول').toList();
    super.initState();
  }
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
            
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx)=> NawlenList(title: dataNawlen[0].status, nawlenList: y))
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
