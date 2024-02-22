import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/employees_details.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';

class ManyEmployees extends StatelessWidget {
  final String title;
  final List<Employees> employeeslist = [
    Employees(
        name: "السائقين",
        num: "10",
        salary: "4000",
        img: Image.asset("assets/images/4.png")),
    Employees(
        name: "التباعين",
        num: "10",
        salary: "3000",
        img: Image.asset("assets/images/5.png")),
    Employees(
        name: "الموظفين",
        num: "50",
        salary: "4000",
        img: Image.asset("assets/images/1.png")),
  ];
  ManyEmployees({super.key, required this.title});

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
          itemCount: employeeslist.length,
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
                    employeeslist[index].name,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  employeeslist[index].num,
                  style: const TextStyle(
                      color: Colors.grey,
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
