import 'package:flutter/material.dart';

class OrderListViewWidget extends StatefulWidget {
  OrderListViewWidget(
      {super.key, required this.cartItemsList, required this.totalPrice});
  final List<Map<String, dynamic>> cartItemsList;
  Function(int) totalPrice;
  @override
  State<OrderListViewWidget> createState() => _OrderListViewWidgetState();
}

class _OrderListViewWidgetState extends State<OrderListViewWidget> {
  final ValueNotifier<List<Map<String, dynamic>>> itemsList = ValueNotifier([
    {"name": "one", "category": "phone", "price": "20", "count": 1},
    {"name": "one", "category": "phone", "price": "20", "count": 1},
    {"name": "one", "category": "phone", "price": "20", "count": 1},
    {"name": "one", "category": "phone", "price": "20", "count": 1},
    {"name": "one", "category": "phone", "price": "20", "count": 1},
  ]);
  int totalPrice = 0;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.cartItemsList.length; i++) {
      totalPrice += int.parse(widget.cartItemsList[i]["price"].toString());
      widget.cartItemsList[i]["count"] = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
      widget.totalPrice(totalPrice);
    final ksize = MediaQuery.sizeOf(context);
    return Expanded(
      child: widget.cartItemsList.isEmpty
          ? const Center(
              child: Text("Your cart is empty!"),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: ksize.height * 0.02,
              ),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: ksize.height * 0.02,
                );
              },
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: false,
              itemCount: widget.cartItemsList.length,
              itemBuilder: (context, index) {
                return ValueListenableBuilder(
                  valueListenable: itemsList,
                  builder: (context, value, child) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(
                                widget.cartItemsList[index]["images"][0]),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.cartItemsList[index]["title"],
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: ksize.height * 0.01,
                                  ),
                                  Text(
                                    widget.cartItemsList[index]["category"],
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: ksize.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (widget.cartItemsList[index]
                                                      ["count"] >
                                                  1) {
                                                widget.cartItemsList[index]
                                                    ["count"] -= 1;
                                              }
                                              totalPrice -= int.parse(widget
                                                  .cartItemsList[index]["price"]
                                                  .toString());
                                              widget.totalPrice(totalPrice);
                                            });
                                          },
                                          icon: const Icon(Icons.remove)),
                                      SizedBox(width: ksize.width * 0.02),
                                      Text(
                                          "${widget.cartItemsList[index]["count"]}"),
                                      SizedBox(width: ksize.width * 0.02),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              widget.cartItemsList[index]
                                                  ["count"] += 1;
                                              totalPrice += int.parse(widget
                                                  .cartItemsList[index]["price"]
                                                  .toString());
                                              widget.totalPrice(totalPrice);
                                            });
                                          },
                                          icon: const Icon(Icons.add)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${widget.cartItemsList[index]["price"]}",
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
