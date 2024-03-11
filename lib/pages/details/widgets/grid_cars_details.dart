import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Provider/cars_providers.dart';
import 'package:flutter_dashboard/model/cars.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:provider/provider.dart';

class GridCarsDetails extends StatefulWidget {
  const GridCarsDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<GridCarsDetails> createState() => _GridCarsDetailsState();
}

class _GridCarsDetailsState extends State<GridCarsDetails> {
  late int totalCars;

  @override
  void initState() {
    super.initState();
    // Fetch car data when the widget initializes
    final idModel = Provider.of<Idmodel>(context, listen: false);
    final id = idModel.id;
    Provider.of<CarsProvider>(context, listen: false)
        .fetchCarsData(id, context);
  }

  void _calculateTotalCars(List<Cars> allCars) {
    totalCars = 0;
    for (var car in allCars) {
      totalCars += (car.carBusy ?? 0) +
          (car.carAvailable ?? 0) +
          (car.carInRoad ?? 0) +
          (car.carUnAvailable ?? 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarsProvider>(
      builder: (context, carsProvider, _) {
        // Check if car data is loaded
        if (carsProvider.allcars.isEmpty) {
          return const CircularProgressIndicator(); // Placeholder for loading indicator
        }
        _calculateTotalCars(carsProvider.allcars);
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
                    bottom: Radius.circular(10), top: Radius.circular(10)),
                    shape: BoxShape.rectangle
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'مجموع السيارات : $totalCars',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: GridView.builder(
                itemCount: carsProvider.allcars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: carsProvider.allcars[index].color,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${carsProvider.allcars[index].statusText}: ',
                          style: const TextStyle(fontSize: 20),
                        ),
                        index == 0
                            ? Text(
                                carsProvider.allcars[index].carBusy.toString(),
                                style: const TextStyle(fontSize: 20),
                              )
                            : index == 1
                                ? Text(
                                    carsProvider.allcars[index].carAvailable
                                        .toString(),
                                    style: const TextStyle(fontSize: 20),
                                  )
                                : index == 2
                                    ? Text(
                                        carsProvider.allcars[index].carInRoad
                                            .toString(),
                                        style: const TextStyle(fontSize: 20),
                                      )
                                    : index == 3
                                        ? Text(
                                            carsProvider
                                                .allcars[index].carUnAvailable
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
    );
  }
}
