import 'package:flutter/material.dart';
import 'package:user_purchase/models/cart_item.dart';

// ignore: must_be_immutable
class CartItemTail extends StatelessWidget {
  CartItem cart;
  void Function()? onPressed;
  CartItemTail({super.key, required this.cart, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(cart.itemName),
        subtitle: Text("\$${cart.itemQty}"),
        trailing: IconButton(onPressed: onPressed, icon: Icon(Icons.delete)),
      ),
    );
  }
}
