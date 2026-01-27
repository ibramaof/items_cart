// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_purchase/features/finished_items/views/add_finished_items_dialog_view.dart';
import 'package:user_purchase/features/finished_items/views/approve_finished_items_dialog_view.dart';
import 'package:user_purchase/core/shared_widgets/buttons.dart';
import 'package:user_purchase/features/finished_items/views/finished_items_details_view.dart';
import 'package:user_purchase/features/finished_items/models/finished_item_model.dart';
import 'package:user_purchase/features/finished_items/models/items_to_add_to_finished_items.dart';
import 'package:user_purchase/core/theme/colors.dart';

class FinishedItemsView extends StatefulWidget {
  const FinishedItemsView({super.key});

  @override
  State<FinishedItemsView> createState() => _FinishedItemsViewState();
}

class _FinishedItemsViewState extends State<FinishedItemsView> {
  final _controller = TextEditingController();
  final user_controller = TextEditingController();
  final password_controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordShown = true;
  String itemName = '1010001 - Osoul | Fresh chicken Skinlese 900 gm';
  void onSelected(dynamic value) {
    setState(() {
      itemName = value;
    });
  }

  void onPressedAddButton() {
    final menuItems = Provider.of<Cart>(context, listen: false).getMenuItems();
    showDialog(
      context: context,
      builder: (context) {
        return AddDialBox(
          selectedItem: itemName,
          onSelected: onSelected,
          items: menuItems,
          onAdd: onAdd,
          controller: _controller,
        );
      },
    );
  }

  void onAdd() {
    if (_controller.text.trim().isEmpty) return;
    final qty = _controller.text.trim();
    FinishedItemModel cartItem = FinishedItemModel(
      itemName: itemName,
      itemQty: qty,
    );
    Provider.of<Cart>(context, listen: false).addItemToCart(cartItem);
    _controller.clear();
    Navigator.pop(context);
  }

  void approveUser() {
    showDialog(
      context: context,
      builder: (context) {
        return ApproveUserBox(
          formKey: formKey,
          userController: user_controller,
          passwordConttoller: password_controller,
          onAdd: () {
            if (formKey.currentState!.validate()) {
              user_controller.clear();
              password_controller.clear();
              Navigator.pop(context);
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    user_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  //delete item from cart
  void deleteItem(FinishedItemModel item) {
    Provider.of<Cart>(context, listen: false).deleteItemFromCart(item);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              'Finished Items',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: kWhiteColor,
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kSecondaryColor, kPrimaryColor],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyGradientButton(label: 'Add', onPressed: onPressedAddButton),
                SizedBox(width: 16),
                MyGradientButton(label: 'Approve', onPressed: approveUser),
              ],
            ),

            SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount: value.userCartItems.length,
                itemBuilder: (context, index) {
                  FinishedItemModel cart = value.getUserCartItems()[index];

                  return FinishedItemsDetaile(
                    cart: cart,
                    onPressed: () => deleteItem(cart),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
