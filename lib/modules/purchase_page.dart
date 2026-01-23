// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_purchase/components/add_dial_box.dart';
import 'package:user_purchase/components/approve_dial_box.dart';
import 'package:user_purchase/components/buttons.dart';
import 'package:user_purchase/components/items_tile.dart';
import 'package:user_purchase/models/cart_item.dart';
import 'package:user_purchase/models/items_data.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final _controller = TextEditingController();
  final user_controller = TextEditingController();
  final password_controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordShown = true;
  String itemName = 'item1';
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
    CartItem cartItem = CartItem(itemName: itemName, itemQty: qty);
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
  void deleteItem(CartItem item) {
    Provider.of<Cart>(context, listen: false).deleteItemFromCart(item);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Buttons(buttonName: 'Add', onPressed: onPressedAddButton),
                Buttons(buttonName: 'Approve', onPressed: approveUser),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Items', style: TextStyle(fontSize: 20)),
                      Text('Qty', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.userCartItems.length,
                itemBuilder: (context, index) {
                  CartItem cart = value.getUserCartItems()[index];

                  return CartItemTail(
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
