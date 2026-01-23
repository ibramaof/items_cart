import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_purchase/models/items_data.dart';
import 'package:user_purchase/modules/purchase_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) =>
          MaterialApp(debugShowCheckedModeBanner: false, home: PurchasePage()),
    );
  }
}
