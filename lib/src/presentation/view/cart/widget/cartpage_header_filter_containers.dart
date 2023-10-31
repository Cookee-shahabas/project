import 'package:flutter/material.dart';

class CartPageFilterContainerWidget extends StatelessWidget {
  CartPageFilterContainerWidget({super.key});
  final List<String> containerTitleList = [
    "Phones",
    "Laptops",
    "Watches",
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: containerTitleList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 15,
              child: Text(
                containerTitleList[index],
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
