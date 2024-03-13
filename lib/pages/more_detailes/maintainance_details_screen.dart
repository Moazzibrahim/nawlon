import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaintainanceDetailsScreen extends StatelessWidget {
  const MaintainanceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBar,
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('#INV0005'),
                      Text('date begin:'),
                      Text('date finish:'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('car details: '),
                      Text('car name:'),
                      Text('car model'),
                      Text('car num:'),
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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Description: '),
                  Expanded(
                    child: Text(
                      'tasle7 w rash rafraf amamy lwko3 7ads alem 3la tare2 el kahra el sa7raway',
                      overflow: TextOverflow.visible,
                      maxLines: 3,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              Row(
                children: [Text('ket3 8yar name: '), Text('rafraf amamy')],
              ),
              Row(
                children: [
                  Text('ket3 8yar num: '),
                  Text('1234'),
                ],
              ),
              Row(
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('service:'),
                    Text('rash'),
                    Text('msan3ya'),
                    Text('3afsha'),
                    Text('swa2a'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('service price:'),
                    Text('200'),
                    Text('523'),
                    Text('100233'),
                    Text('11111'),
                  ],
                )
              ],
            ),
          )
        )
      ]),
    );
  }
}
