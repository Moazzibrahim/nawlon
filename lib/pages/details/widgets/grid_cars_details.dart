// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/cars.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:flutter_dashboard/providers/cars_providers.dart';
import 'package:provider/provider.dart';

class GridCarsDetails extends StatefulWidget {
  const GridCarsDetails({Key? key});

  @override
  State<GridCarsDetails> createState() => _GridCarsDetailsState();
}

class _GridCarsDetailsState extends State<GridCarsDetails> {
  Idmodel? idModel;
  @override
  void initState() {
    super.initState();
    // Fetch car data when the widget initializes
    idModel =
        Provider.of<Idmodel>(context, listen: false); // Initialize Idmodel
    final id = idModel!.id; // Access id property
    Provider.of<CarsProvider>(context, listen: false).fetchCarsData(id,context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarsProvider>(
      builder: (context, carsProvider, _) {
        // Check if car data is loaded
        if (carsProvider.carsData.isEmpty) {
          return const CircularProgressIndicator(); // Show loading indicator
        } else {
          return buildGrid(
              carsProvider.carsData); // Show grid with fetched data
        }
      },
    );
  }

  Widget buildGrid(List<Cars> data) {
    return Column(
      children: [
        // Total cars count
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 33, 34, 45),
          ),
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
                data.length.toString(), // Show total cars count
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
                  color: getColorForStatus(data[index].status),
                ),
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

  Color getColorForStatus(String status) {
    switch (status) {
      case 'معطلة':
        return Colors.red;
      case 'في الطريق':
        return Colors.blue;
      case 'متاح':
        return Colors.green;
      case 'غير متوفرة':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }
}
