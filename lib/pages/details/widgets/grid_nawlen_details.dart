// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Provider/nawlen_provider.dart';

import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/login_model.dart';

import 'package:flutter_dashboard/model/nawlen.dart';
import 'package:flutter_dashboard/pages/more_detailes/nawlen_list.dart';
import 'package:provider/provider.dart';

class GridNawlen extends StatefulWidget {
  const GridNawlen({Key? key}) : super(key: key);

  @override
  State<GridNawlen> createState() => _GridNawlenState();
}

class _GridNawlenState extends State<GridNawlen> {
  int nawlenPindingCount = 0;
  int nawlenDoneCount = 0;

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget initializes
  }

  Future<void> fetchData() async {
    try {
      final tokenProvider = Provider.of<TokenModel>(context, listen: false);
      final token = tokenProvider.token;
      NawlenProvider nawlenProvider = NawlenProvider();
      List<DetailsPinding> dbl = await nawlenProvider.getDetailsPinding(token);

      // Calculate counts from the fetched data
      setState(() {
        nawlenPindingCount =
            dbl.where((detail) => detail.nawlonPrice == 0).length;
        nawlenDoneCount = dbl.where((detail) => detail.nawlonPrice > 0).length;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
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
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (ctx) => NawlenList(
            //           title: 'في الطريق',
            //           nawlenvalue: valuex,
            //           nawlenCars: carNamex,
            //           nawlenTatekLocation: tatekLocationx,
            //           nawlenDownLocation: downLocationx,
            //         )));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: cardBackgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'في الطريق',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'عدد النوالين: $nawlenPindingCount',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => const NawlenList(
                      title: "النوالين",
                    )));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: cardBackgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'النوالين',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'عدد النوالين : $nawlenDoneCount',
                  style: const TextStyle(
                    fontSize: 16,
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
