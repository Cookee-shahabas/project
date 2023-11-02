import 'package:flutter/material.dart';

class CartPageFilterContainerWidget extends StatefulWidget {
  const CartPageFilterContainerWidget(
      {super.key, required this.selectedFilterIndex});
  final Function(int) selectedFilterIndex;

  @override
  State<CartPageFilterContainerWidget> createState() =>
      _CartPageFilterContainerWidgetState();
}

class _CartPageFilterContainerWidgetState
    extends State<CartPageFilterContainerWidget> {
  final List<String> containerTitleList = [
    "All",
    "Groceries",
    "SmartPhone",
    "laptops",
    "fragrances",
    "skincare",
    "home-decoration",
    "furniture",
  ];

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: containerTitleList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget.selectedFilterIndex(index);
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: selectedIndex == index ? Colors.black : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 15,
              child: Text(
                containerTitleList[index],
                style: TextStyle(
                    color:
                        selectedIndex == index ? Colors.white : Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}
