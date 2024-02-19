import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/model/health_model.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:flutter_svg/svg.dart';

class ActivityDetailsCard extends StatelessWidget {
  ActivityDetailsCard({super.key});

  final List<HealthModel> healthDetails = [
    HealthModel(
      icon: "assets/svg/truck.svg",
      title: "السيارات ",
    ),
    HealthModel(
      icon: "assets/svg/distance.svg",
      title: "العناوين",
    ),
    HealthModel(title: "الصيانات", icon: "assets/svg/history.svg"),
    HealthModel(title: "العاملين", icon: "assets/svg/profile.svg"),
    HealthModel(title: "الايرادات والمصروفات", icon: "assets/svg/steps.svg"),
    HealthModel(title: "مخازن", icon: "assets/svg/burn.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: healthDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(healthDetails[i].icon),
              //Container(child: Icon(),),
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 4),
                // child: Text(
                //   healthDetails[i].title,
                //   style: const TextStyle(
                //       fontSize: 18,
                //       color: Colors.white,
                //       fontWeight: FontWeight.w600),
                // ),
              ),
              Text(
                healthDetails[i].title,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
