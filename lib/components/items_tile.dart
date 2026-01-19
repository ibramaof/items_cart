import 'package:flutter/material.dart';

class ItemsTile extends StatelessWidget {
  final String itemName;
  final int itemQty;
  const ItemsTile({super.key, required this.itemName, required this.itemQty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(itemName, style: TextStyle(fontSize: 20)),
          Text(itemQty.toString(), style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
