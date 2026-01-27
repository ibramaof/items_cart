import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_purchase/features/finished_items/models/items_to_add_to_finished_items.dart';
import 'package:user_purchase/features/finished_items/views/finished_items_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FinishedItemsView(),
      ),
    );
  }
}
