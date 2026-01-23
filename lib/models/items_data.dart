import 'package:flutter/material.dart';
import 'package:user_purchase/models/cart_item.dart';

class Cart extends ChangeNotifier {
  // menu items list
  List<CartItem> menuItems = [
    CartItem(itemName: "item1", itemQty: '1'),
    CartItem(itemName: "item2", itemQty: '1'),
    CartItem(itemName: "item3", itemQty: '1'),
    CartItem(itemName: "item4", itemQty: '1'),
    CartItem(itemName: "item5", itemQty: '1'),
    CartItem(itemName: "item6", itemQty: '1'),
    CartItem(itemName: "item7", itemQty: '1'),
    CartItem(itemName: "item8", itemQty: '1'),
  ];

  //user cart items list
  List<CartItem> userCartItems = [];

  //get menu items list
  List<CartItem> getMenuItems() {
    return menuItems;
  }

  //get user cart items list
  List<CartItem> getUserCartItems() {
    return userCartItems;
  }

  //add item to user cart
  void addItemToCart(CartItem item) {
    userCartItems.add(item);
    notifyListeners();
  }

  //delete item from user cart
  void deleteItemFromCart(CartItem item) {
    userCartItems.remove(item);
    notifyListeners();
  }
}
