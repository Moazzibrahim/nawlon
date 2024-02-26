import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/cars.dart';
import 'package:flutter_dashboard/model/login_model.dart';
import 'package:flutter_dashboard/providers/cars_providers.dart';
import 'package:provider/provider.dart';

class GridCarsDetails extends StatefulWidget {
  const GridCarsDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<GridCarsDetails> createState() => _GridCarsDetailsState();
}

class _GridCarsDetailsState extends State<GridCarsDetails> {
  @override
  void initState() {
    super.initState();
    // Fetch car data when the widget initializes
    final idModel = Provider.of<Idmodel>(context, listen: false);
    final id = idModel.id;
    Provider.of<CarsProvider>(context, listen: false)
        .fetchCarsData(id, context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarsProvider>(
      builder: (context, carsProvider, _) {
        // Check if car data is loaded
        if (carsProvider.carsbusy.isEmpty && carsProvider.carsInroad.isEmpty) {
          return const CircularProgressIndicator(); // Show loading indicator
        } else {
          return Column(
            children: [
              SizedBox(height: 200, child: buildGrid(carsProvider.carsbusy)),
              SizedBox(height: 200, child: buildGrid2(carsProvider.carsInroad))
            ],
          ); // Show grid with fetched data
        }
      },
    );
  }

  Widget buildGrid(List<Cars> data) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: data[index].color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'معطلة: ${data[index].carBusy ?? 0}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildGrid2(List<Cars> data) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: data[index].color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'في الطريق: ${data[index].carInRoad ?? 0}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
