import 'package:final_project/src/presentation/view/cart/cartpage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
