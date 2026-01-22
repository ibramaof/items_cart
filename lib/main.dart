import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:user_purchase/pages/purchase_page.dart';

void main() async {
  //initilize hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox('MY_BOX');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PurchasePage());
  }
}
