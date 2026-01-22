import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:user_purchase/components/add_dial_box.dart';
import 'package:user_purchase/components/approve_dial_box.dart';
import 'package:user_purchase/components/buttons.dart';
import 'package:user_purchase/components/items_tile.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final _myBox = Hive.box('MY_BOX');
  final _controller = TextEditingController();
  final user_controller = TextEditingController();
  final password_controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String itemName = 'Apple';
  void onSelected(dynamic value) {
    setState(() {
      itemName = value;
    });
  }

  List items = [];
  List itemsData = ['Apple', 'Orange', 'Banana', 'Tomatos'];
  void onAdd() {
    if (_controller.text.trim().isEmpty) return;
    final qty = int.tryParse(_controller.text);
    if (qty == null) return;

    setState(() {
      items.add([itemName, qty]);
    });
    saveToDatabase();
    _controller.clear();
    Navigator.pop(context);
  }

  //save to database
  void saveToDatabase() {
    _myBox.put("ITEMS_LIST", items);
  }

  void addItemm() {
    showDialog(
      context: context,
      builder: (context) {
        return AddDialBox(
          itemName: itemName,
          onSelected: onSelected,
          items: itemsData,
          onAdd: onAdd,
          controller: _controller,
        );
      },
    );
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
  void initState() {
    // load data and check if null
    items = _myBox.get('ITEMS_LIST') ?? [];
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    user_controller.dispose();
    password_controller.dispose();
    super.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Buttons(buttonName: 'Add', onPressed: addItemm),
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
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ItemsTile(
                  itemName: items[index][0],
                  itemQty: items[index][1],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
