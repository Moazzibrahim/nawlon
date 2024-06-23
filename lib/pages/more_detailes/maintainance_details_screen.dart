import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/model/maintainance_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaintainanceDetailsScreen extends StatelessWidget {
  const MaintainanceDetailsScreen({
    super.key,
    this.title,
    this.dis,
    this.id,
    this.carType,
    this.brand,
    required this.services,
    required this.carName,
    required this.carParts,
    required this.price,
  });

  final String? carName;
  final String? title;
  final String? dis;
  final int? id;
  final String? carType;
  final String? brand;
  final List<ServicesMaintainnance> services;
  final List<CarParts> carParts;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBar,
        title: Text(title!),
      ),
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: Container(
                width: 170.w,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: cardBackgroundColor.withOpacity(0.7)),
              ),
            )
          ],
        ),
        Column(
          children: [
            Expanded(
              child: Container(
                width: 150.w,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: cc),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 400,
              height: 175,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              padding: const EdgeInsets.all(10),
              color: cardBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('#INV$id'),
                      const Text('date begin:'),
                      const Text('date finish:'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('car details: '),
                      Row(
                        children: [
                          const Text('car name:'),
                          Text(carName!),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('car model: '),
                          Text(brand!),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('car type: '),
                          Text(carType!),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 400.w,
              height: 175.h,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: cardBackgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Description: '),
                      Expanded(
                        child: Text(
                          dis!,
                          overflow: TextOverflow.visible,
                          maxLines: 3,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ket3 8yar name: '),
                      for (var e in carParts)
                        Expanded(
                            child: Text(
                          e.name,
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                          softWrap: true,
                        )),
                    ],
                  ),
                  const Row(
                    children: [
                      Text('ket3 8yar num: '),
                      Text('1234'),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('سعر الصيانة: '),
                      Text(price),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            right: 10,
            bottom: 130.h,
            child: SizedBox(
              width: 170.w,
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'اسم الخدمة',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      for (var e in services) Text(e.servicesTitle),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'سعر الخدمة',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      for (var e in services) Text(e.servicesPrice),
                    ],
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
