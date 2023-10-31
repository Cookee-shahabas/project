import 'package:final_project/app/providers/provider.dart';
import 'package:final_project/src/presentation/view/cart/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: kBlocProviders,
      child: const MaterialApp(
        home: CartPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
