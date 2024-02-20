// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/pages/details/widgets/maintainance_details.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';

class Maintainance extends StatelessWidget {
  final String title;
  final maintainanceDetailsList = [
    Maintainancedetails(
        name: "اسم السيارة", date: "تاريخ الصيانة", money: "التكلفة"),
    Maintainancedetails(
        name: "اسم السيارة", date: "تاريخ الصيانة", money: "التكلفة"),
  ];
  Maintainance({
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
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
              crossAxisSpacing: !Responsive.isMobile(context) ? 17 : 12,
              mainAxisSpacing: 16.0),
          itemCount: 2,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CustomCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    maintainanceDetailsList[index].name,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    maintainanceDetailsList[index].date,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    maintainanceDetailsList[index].money,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "تفاصيل",
                      style: TextStyle(color: Colors.deepOrange),
                    ))
              ],
            ));
          },
        ),
      ),
    );
  }
}
