// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Provider/nawlen_provider.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:flutter_dashboard/model/nawlen.dart';
import 'package:flutter_dashboard/pages/details/no_data_screen.dart';
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
  String status='';
  List<int> nawlenValueList = [];
  List<String> tatekLocationList = [];
  List<String> tahmelLocationList = [];
  List<String> carNameList = [];

String statusy='';
  List<int> nawlenValueListy = [];
  List<String> tatekLocationListy = [];
  List<String> tahmelLocationListy = [];
  List<String> carNameListy = [];

  @override
  void initState() {
    fetchDataCount();
    fetchDataPinding();
    fetchDataDone();
    super.initState();
  }
  NawlenProvider nawlenProvider = NawlenProvider();
  Future<void> fetchDataPinding() async {
    try {
      final tokenProvider = Provider.of<TokenModel>(context, listen: false);
      final token = tokenProvider.token;
      List<DetailsPinding> dbl = await nawlenProvider.getDetailsPinding(token);
      Nawlen nawlen = await nawlenProvider.getNawlenData(token);
      setState(() {
        for (var x in dbl) {
          nawlenPindingCount = nawlen.nawlenPindingCount;
          nawlenDoneCount = nawlen.nawlenDoneCount;
          int nawlenValue = x.nawlonPrice;
          String tatekLocation = x.locationTatekName;
          String tahmelLocation = x.locationName;
          String carName = x.car['cars_name'];
          status = x.status;
          nawlenValueList.add(nawlenValue);
          tatekLocationList.add(tatekLocation);
          tahmelLocationList.add(tahmelLocation);
          carNameList.add(carName);
        }
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> fetchDataDone() async{
    try{
      final tokenProvider = Provider.of<TokenModel>(context, listen: false);
      final token = tokenProvider.token;
      NawlenProvider nawlenProvider = NawlenProvider();
      List<DetailsDone> ddl = await nawlenProvider.getDetailsDone(token);
      setState(() {
        for (var x in ddl) {
          int nawlenValue = x.nawlonPrice;
          String tatekLocation = x.locationTatekName;
          String tahmelLocation = x.locationName;
          String carName = x.car['cars_name'];
          statusy = x.status;
          nawlenValueListy.add(nawlenValue);
          tatekLocationListy.add(tatekLocation);
          tahmelLocationListy.add(tahmelLocation);
          carNameListy.add(carName);
        }
      });
    }catch(e){
      log('Error: $e');
    }
  }

  Future<void> fetchDataCount() async{
      final tokenProvider = Provider.of<TokenModel>(context, listen: false);
      final token = tokenProvider.token;
      NawlenProvider nawlenProvider = NawlenProvider();
      Nawlen nawlen = await nawlenProvider.getNawlenData(token);
      setState(() {
        nawlenPindingCount = nawlen.nawlenPindingCount;
          nawlenDoneCount = nawlen.nawlenDoneCount;
      });
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
            if(nawlenProvider.l.isNotEmpty){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => NawlenList(
                      title: 'في الطريق',
                      nawlenValue: nawlenValueList,
                      tatekLocation: tatekLocationList,
                      tahmelLocation: tahmelLocationList,
                      carName: carNameList,
                    )));
            }else{
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx)=> const NoDataScreen())
              );
            }
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
                  style:
                      const TextStyle(fontSize: 16, color: Colors.deepOrange),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () async{
            if(nawlenProvider.l.isNotEmpty){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => NawlenList(
                      title: 'باقي الناواين',
                      nawlenValue: nawlenValueListy,
                      tatekLocation: tatekLocationListy,
                      tahmelLocation: tahmelLocationListy,
                      carName: carNameListy,
                    )));
            }else{
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx)=> const NoDataScreen())
              );
            }
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
                  style:
                      const TextStyle(fontSize: 16, color: Colors.deepOrange),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
