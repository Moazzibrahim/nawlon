// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Provider/inventory_provider.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:provider/provider.dart';

class GridInventory extends StatefulWidget {
  final String title;
  const GridInventory({
    Key? key,
    required this.title,
  }) : super(key: key);

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
          builder: (context, InventoryProvider, _) {
            if (InventoryProvider.allInventory.isEmpty) {
              return const CircularProgressIndicator();
            }
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
                    itemCount: InventoryProvider.allInventory.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: InventoryProvider.allInventory[index].color,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${InventoryProvider.allInventory[index]} ',
                              style: const TextStyle(fontSize: 20),
                            ),
                            index == 0
                                ? Text(
                                    InventoryProvider.allInventory[index].carpartname
                                        .toString(),
                                    style: const TextStyle(fontSize: 20),
                                  )
                                : index == 1
                                    ? Text(
                                        InventoryProvider.allInventory[index].carpartlocation
                                            .toString(),
                                        style: const TextStyle(fontSize: 20),
                                      )
                                    : index == 2
                                        ? Text(
                                            InventoryProvider
                                                .allInventory[index].carPartPrice
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
        ),
      ),
    );
  }
}
