// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Provider/money_provider.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:provider/provider.dart';

class Money extends StatefulWidget {
  final String title;
  const Money({super.key, required this.title});

  @override
  State<Money> createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  @override
  void initState() {
    super.initState();
    // Fetch car data when the widget initializes
    Provider.of<MoneyProvider>(context, listen: false)
        .getMoney(context)
        .catchError((error) {
      // Handle errors here, e.g., show an error message
      print('Error fetching maintainance data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBar,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Consumer<MoneyProvider>(builder: (context, Moneyprovider, _) {
          if (Moneyprovider.moneyList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemCount: Moneyprovider.moneyList.length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Moneyprovider.moneyList[index].color),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${Moneyprovider.moneyList[index].status}"),
                        index == 0
                            ? Text(
                                ' ${Moneyprovider.moneyList.isNotEmpty ? Moneyprovider.moneyList[0].totRevenue.toString() : ''}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            : index == 1
                                ? Text(
                                    ' ${Moneyprovider.moneyList.isNotEmpty ? Moneyprovider.moneyList[1].totExpense.toString() : ''}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                : index == 2
                                    ? Text(
                                        ' ${Moneyprovider.moneyList.isNotEmpty ? Moneyprovider.moneyList[2].totProfit.toString() : ''}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const Text("unavailable")
                      ],
                    ));
              },
            );
          }
        }),
      ),
    );
  }
}
