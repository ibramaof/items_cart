import 'package:flutter/material.dart';
import 'package:user_purchase/features/finished_items/models/finished_item_model.dart';
import 'package:user_purchase/core/theme/colors.dart';

// ignore: must_be_immutable
class FinishedItemsDetaile extends StatelessWidget {
  FinishedItemModel cart;
  void Function()? onPressed;
  FinishedItemsDetaile({
    super.key,
    required this.cart,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: const EdgeInsetsDirectional.only(start: 15, end: 15, bottom: 12),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kPrimaryColor.withAlpha(opacityToAlpha(0.2)),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(opacityToAlpha(0.05)),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    cart.itemName,
                    maxLines: 4,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Total Quantity
              Container(
                width: 60,
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
                decoration: BoxDecoration(
                  gradient: kMainGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      cart.itemQty,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kWhiteColor,
                      ),
                    ),
                    Text(
                      'Quantity',
                      style: TextStyle(fontSize: 10, color: kWhiteColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Available Quantity
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  width: 60,

                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: kWhiteColor,

                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: kRedColor.withAlpha(opacityToAlpha(0.3)),
                      width: 1,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: kRedColor.withAlpha(opacityToAlpha(0.3)),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: kRedColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
