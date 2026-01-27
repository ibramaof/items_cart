// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_purchase/features/finished_items/controllers/finished_items_controller.dart';
import 'package:user_purchase/features/finished_items/views/add_finished_items_dialog_view.dart';
import 'package:user_purchase/features/finished_items/views/approve_finished_items_dialog_view.dart';
import 'package:user_purchase/core/shared_widgets/buttons.dart';
import 'package:user_purchase/features/finished_items/views/finished_items_details_view.dart';
import 'package:user_purchase/features/finished_items/models/finished_item_model.dart';

import 'package:user_purchase/core/theme/colors.dart';

class FinishedItemsView extends StatelessWidget {
  const FinishedItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: GetBuilder(
        init: FinishedItemsController(),
        builder: (controller) {
          return Column(
            children: [
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyGradientButton(
                    label: 'Add',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AddDialBox(
                            selectedItem: controller.itemName,
                            onSelected: controller.onSelected,
                            items: controller.fisnishedItemsModel.menuItems,
                            onAdd: controller.onAdd,
                            controller: controller.controller,
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(width: 16),
                  MyGradientButton(
                    label: 'Approve',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ApproveUserBox(
                            formKey: controller.formKey,
                            userController: controller.email_controller,
                            passwordConttoller: controller.password_controller,
                            onApprove: controller.onApprove,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 30),

              Expanded(
                child: ListView.builder(
                  itemCount: controller.userCartItems.length,
                  itemBuilder: (context, index) {
                    FinishedItemModel finishedItemModel =
                        controller.userCartItems[index];

                    return FinishedItemsDetaile(
                      cart: finishedItemModel,
                      onPressed: () =>
                          controller.deleteItemFromCart(finishedItemModel),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
