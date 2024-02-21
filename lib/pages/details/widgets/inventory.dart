// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_dashboard/model/inventory_details.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';

class Inventory extends StatelessWidget {
  final String title;
  final List<Inventorydetails> inventoryitems = [
    Inventorydetails(name: "منتج 1", quantity: "100", place: "مخزن 1"),
    Inventorydetails(name: "منتج 2", quantity: "200", place: "مخزن 2"),
    Inventorydetails(name: "منتج 3", quantity: "300", place: "مخزن 3"),
  ];
  Inventory({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
              crossAxisSpacing: !Responsive.isMobile(context) ? 17 : 12,
              mainAxisSpacing: 16.0),
          itemCount: inventoryitems.length,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CustomCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 5),
                  child: Text(
                    inventoryitems[index].name,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  inventoryitems[index].quantity,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    inventoryitems[index].place,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ));
          },
        ),
      ),
    );
  }
}
