// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Provider/maintainance_provider.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/pages/more_detailes/maintainance_details_screen.dart';
import 'package:provider/provider.dart';

class Maintainance extends StatefulWidget {
  final String title;

  const Maintainance({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<Maintainance> createState() => _MaintainanceState();
}

class _MaintainanceState extends State<Maintainance> {
  @override
  void initState() {
    super.initState();
    // Fetch car data when the widget initializes
    Provider.of<Maintainanceprovider>(context, listen: false)
        .getMaintainancedata(context)
        .catchError((error) {
      // Handle errors here, e.g., show an error message
      print('Error fetching maintainance data: $error');
    });
    // Provider.of<Maintainanceprovider>(context, listen: false)
    //     .getServicesMaintainance(context)
    //     .catchError((error) {
    //   // Handle errors here, e.g., show an error message
    //   print('Error fetching services data: $error');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBar,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<Maintainanceprovider>(
          builder: (context, maintainanceProvider, _) {
            if (maintainanceProvider.allmaintainance.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: maintainanceProvider.allmaintainance.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final maintainanceItem =
                            maintainanceProvider.allmaintainance[index];
                        // final x = maintainanceProvider.allServices[index];
                        return Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: cardBackgroundColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الاسم:  ${maintainanceItem.name}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                // Set text direction explicitly for right-to-left languages
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'التاريخ:  ${maintainanceItem.date}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'السعر: ${maintainanceItem.price}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    child: const Text(
                                      "تفاصيل",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  MaintainanceDetailsScreen(
                                                    title: widget.title,
                                                    dis: maintainanceItem
                                                        .discription,
                                                    id: maintainanceItem.id,
                                                    carType: maintainanceItem
                                                        .carType,
                                                    brand:
                                                        maintainanceItem.brand,
                                                    servicesTitle:
                                                        ''
                                                  )));
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
