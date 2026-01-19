import 'package:flutter/material.dart';
import 'package:user_purchase/components/buttons.dart';

// ignore: must_be_immutable
class AddDialBox extends StatelessWidget {
  final List items;
  VoidCallback onAdd;
  void Function(dynamic) onSelected;
  final String itemName;

  final TextEditingController controller;

  AddDialBox({
    super.key,
    required this.items,
    required this.onAdd,
    required this.controller,
    required this.onSelected,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: SizedBox(
        height: 202,
        child: Center(
          child: Column(
            children: [
              DropdownMenu(
                label: Text("items"),
                initialSelection: "apple",
                onSelected: onSelected,
                menuStyle: MenuStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.grey[200]),
                  elevation: WidgetStateProperty.all(6),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                dropdownMenuEntries: items
                    .map((item) => DropdownMenuEntry(value: item, label: item))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Qty',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Buttons(buttonName: 'Add', onPressed: onAdd)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
