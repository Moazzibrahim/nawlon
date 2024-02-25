import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/money_details.dart';
import 'package:flutter_dashboard/responsive.dart';

class Money extends StatelessWidget {
  final String title;
  final List<Moneydetails> moneylist = [
    Moneydetails(name: "الايرادات", money: "1500", color: Colors.blue),
    Moneydetails(name: "المصروفات", money: "1000", color: Colors.red),
    Moneydetails(name: "صافي الربح", money: "500", color: Colors.green),
  ];
  Money({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBar,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
              crossAxisSpacing: !Responsive.isMobile(context) ? 17 : 12,
              mainAxisSpacing: 16.0),
          itemCount: moneylist.length,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: moneylist[index].color),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 5),
                      child: Text(
                        moneylist[index].name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      moneylist[index].money,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
