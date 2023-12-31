import 'package:final_project/src/presentation/core/widgets/sliver.dart';
import 'package:final_project/src/presentation/view/cart/widget/cartpage_header_filter_containers.dart';
import 'package:final_project/src/presentation/view/cart/widget/cartpage_listview.dart';
import 'package:final_project/src/presentation/view/order/order_screen.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int selectedFilterIndex = 0;
  List<Map<String, dynamic>> cartItemsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                  minHeight: 200,
                  maxHeight: 200,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.black,
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderScreen(
                                                cartItemsList: cartItemsList,
                                              )),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.shopping_bag,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "GADGETS",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 30,
                            child: CartPageFilterContainerWidget(
                              selectedFilterIndex: (index) {
                                setState(() {
                                  selectedFilterIndex = index;
                                });
                              },
                            )),
                      ],
                    ),
                  ))),
          SliverList(
              delegate: SliverChildListDelegate([
            CartPageListPageWidget(
              cartedItemsList: (items) {
                setState(() {
                  cartItemsList = items;
                });
              },
              selectedFilterIndex: selectedFilterIndex,
            )
          ])),
        ],
      ),
    );
  }
}
