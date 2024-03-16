import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaintainanceDetailsScreen extends StatelessWidget {
  const MaintainanceDetailsScreen({
    super.key,
    this.title,
    this.dis,
    this.id,
    this.carType,
    this.brand,
    this.servicesTitle,
    this.serviceprice,
  });
  final String? title;
  final String? dis;
  final int? id;
  final String? carType;
  final String? brand;
  final String? servicesTitle;
  final String? serviceprice;

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
                      const Text('car name:'),
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
                  const Row(
                    children: [Text('ket3 8yar name: '), Text('carPartsName')],
                  ),
                  const Row(
                    children: [
                      Text('ket3 8yar num: '),
                      Text('1234'),
                    ],
                  ),
                  const Row(
                    children: [
                      Text('Syana Price: '),
                      Text('500'),
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
              height: 120.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('service:'),
                      Text(servicesTitle!),
                      // const Text('msan3ya'),
                      // const Text('3afsha'),
                      // const Text('swa2a'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('services price'),
                      Text(serviceprice!),
                      // const Text('523'),
                      // const Text('100233'),
                      // const Text('11111'),
                    ],
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
