// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_purchase/features/finished_items/models/finished_item_model.dart';
import 'package:user_purchase/features/finished_items/models/items_to_add_to_finished_items.dart';

class FinishedItemsController extends GetxController {
  final TextEditingController controller = TextEditingController();
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ItemsTOAddToFinishedItems fisnishedItemsModel = ItemsTOAddToFinishedItems();
  String itemName = '1010001 - Osoul | Fresh chicken Skinlese 900 gm';

  //select item from itemsMenu

  void onSelected(String value) {
    itemName = value;
    update();
  }

  //on press on Add button after slect items and QTY

  void onAdd() {
    if (controller.text.trim().isEmpty) {
      return;
    }
    final qty = controller.text.trim();
    FinishedItemModel finishedItemModel = FinishedItemModel(
      itemName: itemName,
      itemQty: qty,
    );
    addItemToCart(finishedItemModel);
    controller.clear();
    Get.back();
  }

  //on press add button in aprove dialog

  void onApprove() {
    if (formKey.currentState!.validate()) {
      email_controller.clear();
      password_controller.clear();
      Get.back();
    }
  }

  //menu item list

  //user cart items list
  List<FinishedItemModel> userCartItems = [];

  //get menu items list
  List<FinishedItemModel> getMenuItems() {
    return fisnishedItemsModel.menuItems;
  }

  //add item to user cart
  void addItemToCart(FinishedItemModel item) {
    userCartItems.add(item);
    update();
  }

  //delete item from user cart
  void deleteItemFromCart(FinishedItemModel item) {
    userCartItems.remove(item);
    update();
  }

  @override
  void onClose() {
    controller.dispose();
    password_controller.dispose();
    email_controller.dispose();
    super.onClose();
  }
}
