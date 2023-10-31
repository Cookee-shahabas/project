import 'package:final_project/src/presentation/core/images/constant_images.dart';
import 'package:flutter/material.dart';

class CartPageListPageWidget extends StatelessWidget {
  CartPageListPageWidget({super.key});
  final List<Map<String, dynamic>> itemsList = [
    {"name": "one", "category": "phone", "price": "20"},
    {"name": "one", "category": "phone", "price": "20"},
    {"name": "one", "category": "phone", "price": "20"},
    {"name": "one", "category": "phone", "price": "20"},
    {"name": "one", "category": "phone", "price": "20"},
  ];
  @override
  Widget build(BuildContext context) {
    final ksize = MediaQuery.sizeOf(context);
    return SizedBox(
      height: ksize.height,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 25,
          );
        },
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
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
                          itemsList[index]["name"],
                          style: const TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: ksize.height * 0.01,
                        ),
                        Text(
                          itemsList[index]["category"],
                          style: const TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: ksize.height * 0.01,
                        ),
                        const Text("rating"),
                        SizedBox(
                          height: ksize.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${itemsList[index]["price"]}",
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
      ),
    );
  }
}
