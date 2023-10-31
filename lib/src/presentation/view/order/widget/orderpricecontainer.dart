import 'package:flutter/material.dart';

class OrderPagePriceContainer extends StatelessWidget {
  const OrderPagePriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final ksize = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(20),
      width: ksize.width,
      height: ksize.height * 0.2,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Total Amount :"), Text("Price")],
          ),
          SizedBox(
            height: ksize.height * 0.02,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  fixedSize: Size(ksize.width, ksize.height * 0.02)),
              onPressed: () {},
              child: const Text("Order Now"))
        ],
      ),
    );
  }
}
