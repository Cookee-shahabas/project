import 'package:final_project/src/presentation/view/order/widget/oderlistviewwidget.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ksize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "My Bag",
                style: TextStyle(color: Colors.black, fontSize: 35,
                ),
              ),
              SizedBox(
                height: ksize.height * 0.02,
              ),
              OrderListViewWidget()
            ],
          ),
        ),
      ),
    );
  }
}
