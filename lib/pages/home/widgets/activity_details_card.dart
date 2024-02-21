import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/model/home_model.dart';
import 'package:flutter_dashboard/pages/details/cars_details_page.dart';
import 'package:flutter_dashboard/pages/details/employees.dart';
import 'package:flutter_dashboard/pages/details/maintainance.dart';
import 'package:flutter_dashboard/pages/details/nawlen_page.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';

class ActivityDetailsCard extends StatelessWidget {
  ActivityDetailsCard({super.key});

  final List<HomeModel> homeDetails = [
    HomeModel(
      icon: const Icon(
        Icons.directions_car,
        color: Colors.deepOrange,
        size: 50,
      ),
      title: "السيارات",
    ),
    HomeModel(
      icon: const Icon(
        Icons.directions,
        color: Colors.deepOrange,
        size: 50,
      ),
      title: "النوالين",
    ),
    HomeModel(
      title: "الصيانات",
      icon: const Icon(
        Icons.car_repair_outlined,
        color: Colors.deepOrange,
        size: 50,
      ),
    ),
    HomeModel(
      title: "العاملين",
      icon: const Icon(
        Icons.group,
        color: Colors.deepOrange,
        size: 50,
      ),
    ),
    HomeModel(
      title: "الايرادات والمصروفات",
      icon: const Icon(
        Icons.money,
        color: Colors.deepOrange,
        size: 50,
      ),
    ),
    HomeModel(
      title: "مخازن",
      icon: const Icon(
        Icons.warehouse,
        color: Colors.deepOrange,
        size: 50,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: homeDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            if (homeDetails[i].title == "العاملين") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManyEmployees(
                      title: homeDetails[i].title,
                    ),
                  ));
            } else if (homeDetails[i].title == "الصيانات") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Maintainance(
                      title: homeDetails[i].title,
                    ),
                  ));
            } else if (homeDetails[i].title == 'السيارات') {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => CarsDetailsPage(
                        title: homeDetails[i].title,
                      )));
            } else if (homeDetails[i].title == 'النوالين') {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => NawlenPage(
                        title: homeDetails[i].title,
                      )));
            }else if(homeDetails[i].title == 'الايرادات والمصروفات'){
              
            }
          },
          child: CustomCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                homeDetails[i].icon,
                Text(
                  homeDetails[i].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
