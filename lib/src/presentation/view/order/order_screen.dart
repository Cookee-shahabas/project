import 'package:final_project/src/presentation/view/order/widget/oderlistviewwidget.dart';
import 'package:final_project/src/presentation/view/order/widget/orderpricecontainer.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.cartItemsList});
  final List<Map<String, dynamic>> cartItemsList;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

double totalPrices = 0;

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final ksize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        elevation: 0,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "My Bag",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(
              height: ksize.height * 0.02,
            ),
            OrderListViewWidget(
              cartItemsList: widget.cartItemsList,
              totalPrice: (amount) {
                Future.delayed(Duration.zero, () {
                  setState(() {
                    totalPrices = amount;
                  });
                });
              },
            ),
            OrderPagePriceContainer(
              cartItemsList: widget.cartItemsList,
              totalPrice: totalPrices,
            )
          ],
        ),
      ),
    );
  }
}
