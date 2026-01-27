import 'package:flutter/material.dart';
import 'package:user_purchase/core/shared_widgets/buttons.dart';
import 'package:user_purchase/features/finished_items/models/finished_item_model.dart';
import 'package:user_purchase/core/theme/colors.dart';

// ignore: must_be_immutable
class AddDialBox extends StatelessWidget {
  final List<FinishedItemModel> items;
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
      backgroundColor: kWhiteColor,
      content: Padding(
        padding: const EdgeInsetsDirectional.only(top: 15),
        child: SizedBox(
          // height: 202,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownMenu(
                label: Text(
                  "Items",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                initialSelection:
                    "1010001 - Osoul | Fresh chicken Skinlese 900 gm",
                onSelected: (value) => onSelected(value!),
                menuStyle: MenuStyle(
                  backgroundColor: WidgetStateProperty.all(kWhiteColor),
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
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Quantity',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyGradientButton(
                      isSecondary: false,
                      label: 'Add',
                      onPressed: onAdd,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
