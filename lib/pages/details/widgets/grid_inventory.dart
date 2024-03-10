import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Provider/inventory_provider.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:provider/provider.dart';

class GridInventory extends StatefulWidget {
  final String title;

  const GridInventory({
    required this.title,
  });

  @override
  State<GridInventory> createState() => _GridInventoryState();
}

class _GridInventoryState extends State<GridInventory> {
  @override
  void initState() {
    super.initState();
    // Fetch car data when the widget initializes
    Provider.of<InventoryProvider>(context, listen: false)
        .fetchinventoryData(context);
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
        child: Consumer<InventoryProvider>(
          builder: (context, inventoryProvider, _) {
            if (inventoryProvider.allInventory.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: inventoryProvider.allInventory.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final inventoryItem =
                            inventoryProvider.allInventory[index];
                        return Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Car Part Name: ${inventoryItem.carpartname}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Location: ${inventoryItem.carpartlocation}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                'Quantity: ${inventoryItem.quantity}',
                                style: const TextStyle(fontSize: 20),
                              ),
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
