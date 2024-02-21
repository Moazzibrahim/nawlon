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
    Nawlen(
        car: 'nusa',
        tatekLocation: 'bahary',
        downLocation: 'sidi beshr',
        status: 'في الطريق'),
    Nawlen(
        car: 'zoza',
        tatekLocation: 'manshia',
        downLocation: 'sidi gaber',
        status: 'في الطريق'),
    Nawlen(
        car: 'aziza',
        tatekLocation: 'miami',
        downLocation: 'amrya',
        status: 'في الطريق'),
    Nawlen(
        car: 'zoba',
        tatekLocation: 'moharem beh',
        downLocation: 'dkhela',
        status: 'تم الوصول'),
  ];
  List<String> x = [];
  List<String> y = [];
  List<String> carNamex = [];
  List<String> carNamey = [];
  List<String> tatekLocationx = [];
  List<String> tatekLocationy = [];
  List<String> downLocationx = [];
  List<String> downLocationy = [];

  @override
  void initState() {
    x = dataNawlen.map((e) => e.status).toList();
    x = x.where((e) => e == 'في الطريق').toList();
    y = dataNawlen.map((e) => e.status).toList();
    y = y.where((e) => e == 'تم الوصول').toList();
    carNamex = dataNawlen
        .where((e) => e.status.contains('في الطريق'))
        .map((e) => e.car)
        .toList();
    carNamey = dataNawlen
        .where((e) => e.status.contains('تم الوصول'))
        .map((e) => e.car)
        .toList();
    tatekLocationx = dataNawlen
        .where((e) => e.status.contains('في الطريق'))
        .map((e) => e.tatekLocation)
        .toList();
    tatekLocationy = dataNawlen
        .where((e) => e.status.contains('تم الوصول'))
        .map((e) => e.tatekLocation)
        .toList();
    downLocationx = dataNawlen
        .where((e) => e.status.contains('في الطريق'))
        .map((e) => e.downLocation)
        .toList();
    downLocationy = dataNawlen
        .where((e) => e.status.contains('تم الوصول'))
        .map((e) => e.downLocation)
        .toList();
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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => NawlenList(
                      title: 'في الطريق',
                      nawlenStatus: x,
                      nawlenCars: carNamex,
                      nawlenTatekLocation: tatekLocationx,
                      nawlenDownLocation: downLocationx,
                    )));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: cardBackgroundColor,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'في الطريق',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => NawlenList(
                      title: 'الباقي',
                      nawlenStatus: y,
                      nawlenCars: carNamey,
                      nawlenTatekLocation: tatekLocationy,
                      nawlenDownLocation: downLocationy,
                    )));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: cardBackgroundColor,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الباقي',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
