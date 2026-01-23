import 'package:flutter/material.dart';
import 'package:user_purchase/components/buttons.dart';
import 'package:user_purchase/models/cart_item.dart';

// ignore: must_be_immutable
class AddDialBox extends StatelessWidget {
  final List<CartItem> items;
  final TextEditingController controller;
  final String selectedItem;
  final void Function(String) onSelected;
  final VoidCallback onAdd;

  const AddDialBox({
    super.key,
    required this.items,
    required this.controller,
    required this.selectedItem,
    required this.onSelected,
    required this.onAdd,
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
                label: Text("item1"),
                initialSelection: "item1",
                onSelected: (value) => onSelected(value!),
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
                    .map(
                      (item) => DropdownMenuEntry(
                        value: item.itemName,
                        label: item.itemName,
                      ),
                    )
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
