// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Provider/employees_provider.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/employees_details.dart';
import 'package:provider/provider.dart';

class ManyEmployees extends StatefulWidget {
  final String title;
  const ManyEmployees({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ManyEmployees> createState() => _ManyEmployeesState();
}

class _ManyEmployeesState extends State<ManyEmployees> {
  late int totalemployees;
  @override
  void initState() {
    super.initState();
    // Fetch car data when the widget initializes
    Provider.of<Employeeprovider>(context, listen: false)
        .getMaintainance(context);
  }

  void calculateTotalemployees(List<Employeedetails> allemployees) {
    totalemployees = 0;
    for (var z in allemployees) {
      totalemployees += (z.driverAvailable ?? 0) +
          (z.driverFollowAvailable ?? 0) +
          (z.employeeAvailable ?? 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBar,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<Employeeprovider>(
          builder: (context, Employeeprovider, _) {
            if (Employeeprovider.allMaintainance.isEmpty) {
              return const CircularProgressIndicator();
            }
            calculateTotalemployees(Employeeprovider.allMaintainance);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: const Color(0xFF21222D),
                      border: Border.all(
                          color: const Color(0xFF21222D)), // Border styling
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(10),
                          top: Radius.circular(10)),
                      shape: BoxShape.rectangle),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'مجموع العاملين : $totalemployees',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: Employeeprovider.allMaintainance.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final employeedetails =
                          Employeeprovider.allMaintainance[index];
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Employeeprovider.allMaintainance[index].color,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${employeedetails.status} ',
                              style: const TextStyle(fontSize: 20),
                            ),
                            index == 0
                                ? Text(
                                    Employeeprovider
                                        .allMaintainance[index].driverAvailable
                                        .toString(),
                                    style: const TextStyle(fontSize: 20),
                                  )
                                : index == 1
                                    ? Text(
                                        Employeeprovider.allMaintainance[index]
                                            .driverFollowAvailable
                                            .toString(),
                                        style: const TextStyle(fontSize: 20),
                                      )
                                    : index == 2
                                        ? Text(
                                            Employeeprovider
                                                .allMaintainance[index]
                                                .employeeAvailable
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 20),
                                          )
                                        : const Text('unavailable')
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
