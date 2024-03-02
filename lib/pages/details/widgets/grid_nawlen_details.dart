import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Provider/nawlen_provider.dart';

import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/login_model.dart';

import 'package:flutter_dashboard/model/nawlen.dart';
import 'package:flutter_dashboard/pages/more_detailes/nawlen_list.dart';
import 'package:provider/provider.dart';


class GridNawlen extends StatefulWidget {
  const GridNawlen({super.key});

  @override
  State<GridNawlen> createState() => _GridNawlenState();
}

class _GridNawlenState extends State<GridNawlen> {
  final List<Nawlen> dataNawlen = [];

  List<int> valuex = [];
  List<int> valuey = [];
  List<String> carNamex = [];
  List<String> carNamey = [];
  List<String> tatekLocationx = [];
  List<String> tatekLocationy = [];
  List<String> downLocationx = [];
  List<String> downLocationy = [];

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
          onTap: () async{
            final tokenProvider = Provider.of<TokenModel>(context, listen: false);
            final token = tokenProvider.token;
            NawlenProvider nawlenProvider = NawlenProvider();
            var dbl = await nawlenProvider.getDetailsPinding(token);
            initState(
              
            );
            // ignore: use_build_context_synchronously
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => NawlenList(
                      title: 'في الطريق',
                      nawlenvalue: valuex,
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
                //counter
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => NawlenList(
                      title: 'الباقي',
                      nawlenvalue: valuey,
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
                //counter
              ],
            ),
          ),
        )
      ],
    );
  }
}
