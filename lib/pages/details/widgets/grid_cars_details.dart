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
    return Consumer<CarsProvider>(builder: (context, carsProvider, _) {
      // Check if car data is loaded
      return GridView.builder(
        itemCount: carsProvider.allcars.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding:const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: carsProvider.allcars[index].color,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${carsProvider.allcars[index].statusText}: ',style: TextStyle(fontSize: 20),),
                index ==0 ? Text(carsProvider.allcars[index].carBusy.toString(),style: TextStyle(fontSize: 20),):
                index ==1 ? Text(carsProvider.allcars[index].carAvailable.toString(),style: TextStyle(fontSize: 20),):
                index ==2 ? Text(carsProvider.allcars[index].carInRoad.toString(),style: TextStyle(fontSize: 20),):
                index ==3 ? Text(carsProvider.allcars[index].carUnAvailable.toString(),style: TextStyle(fontSize: 20),): const Text('unavailable')
              ],
            ),
          );
        },
      );
    }
    );
  }
}


