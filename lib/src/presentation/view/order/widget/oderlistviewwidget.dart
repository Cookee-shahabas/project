import 'package:final_project/src/presentation/core/images/constant_images.dart';
import 'package:flutter/material.dart';

class OrderListViewWidget extends StatefulWidget {
  const OrderListViewWidget({super.key});

  @override
  State<OrderListViewWidget> createState() => _OrderListViewWidgetState();
}

class _OrderListViewWidgetState extends State<OrderListViewWidget> {
  final ValueNotifier<List<Map<String, dynamic>>> itemsList = ValueNotifier([
    {"name": "one", "category": "phone", "price": "20", "count": 0},
    {"name": "one", "category": "phone", "price": "20", "count": 0},
    {"name": "one", "category": "phone", "price": "20", "count": 0},
    {"name": "one", "category": "phone", "price": "20", "count": 0},
    {"name": "one", "category": "phone", "price": "20", "count": 0},
  ]);

  @override
  Widget build(BuildContext context) {
    final ksize = MediaQuery.sizeOf(context);
    return Expanded(
      child: ListView.separated(
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
        itemCount: itemsList.value.length,
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
                      child: Image.asset(ConstantImages.image1),
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
                              value[index]["name"],
                              style: const TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              height: ksize.height * 0.01,
                            ),
                            Text(
                              value[index]["category"],
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
                                        if (value[index]["count"] > 0) {
                                          value[index].update(
                                              "count", (value) => value - 1);
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.remove)),
                                SizedBox(width: ksize.width * 0.02),
                                Text("${value[index]["count"]}"),
                                SizedBox(width: ksize.width * 0.02),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        value[index].update(
                                            "count", (value) => value + 1);
                                      });
                                    },
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                            SizedBox(
                              height: ksize.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${value[index]["price"]}",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const Icon(Icons.favorite_outline)
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
