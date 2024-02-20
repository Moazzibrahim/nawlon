import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/cars.dart';

class GridCarsDetails extends StatefulWidget {
  const GridCarsDetails({super.key});

  @override
  State<GridCarsDetails> createState() => _GridCarsDetailsState();
}

class _GridCarsDetailsState extends State<GridCarsDetails> {
  final List data = [
    Cars(num: 3, status: 'معطلة', color: const Color.fromARGB(255, 240, 23, 7)),
    Cars(
        num: 5,
        status: 'في الطريق',
        color: const Color.fromRGBO(55, 68, 207, 1)),
    Cars(num: 4, status: 'متاح', color: Colors.green),
  ];

  List nums = [];
  dynamic sum = 0;
  @override
  void initState() {
    nums = data.map((e) => e.num).toList();
    for (var x in nums) {
      sum += x;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 33, 34, 45)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total Cars:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                sum.toString(),
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: data[index].color),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data[index].num.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data[index].status,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 15,
            ),
          ),
        ),
      ],
    );
  }
}
