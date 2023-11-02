import 'package:final_project/app/constants/status.dart';
import 'package:final_project/src/application/cartPage/bloc/cart_page_bloc_bloc.dart';
import 'package:final_project/src/insfrastructure/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CartPageListPageWidget extends StatefulWidget {
  CartPageListPageWidget(
      {super.key,
      required this.selectedFilterIndex,
      required this.cartedItemsList});
  int selectedFilterIndex = 0;
  final Function(List<Map<String, dynamic>>) cartedItemsList;
  @override
  State<CartPageListPageWidget> createState() => _CartPageListPageWidgetState();
}

class _CartPageListPageWidgetState extends State<CartPageListPageWidget> {
  @override
  void initState() {
    super.initState();
    context
        .read<CartPageBlocBloc>()
        .add(const CartPageBlocEvent.cartpageData());
  }

  List<Map<String, dynamic>> cartedItems = [];

  @override
  Widget build(BuildContext context) {
    final ksize = MediaQuery.sizeOf(context);
    return BlocBuilder<CartPageBlocBloc, CartPageBlocState>(
      buildWhen: (previous, current) =>
          previous.cartPageState != current.cartPageState,
      builder: (context, state) {
        if (state.cartPageState is StatusLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.cartPageState is StatusSuccess) {
          CartModelSample cartData = state.productData;
          var groceries = [];
          var furniture = [];
          var smartphones = [];
          var laptops = [];
          var fragrances = [];
          var skincare = [];
          var homeDecoration = [];
          for (int i = 0; i < 100; i++) {
            if (cartData.items["products"] != null &&
                cartData.items["products"][i]["category"] == "groceries") {
              groceries.add(cartData.items["products"][i]);
            }
            if (cartData.items["products"] != null &&
                cartData.items["products"][i]["category"] == "furniture") {
              furniture.add(cartData.items["products"][i]);
            }
            if (cartData.items["products"] != null &&
                cartData.items["products"][i]["category"] == "smartphones") {
              smartphones.add(cartData.items["products"][i]);
            }
            if (cartData.items["products"][i]["category"] == "laptops") {
              laptops.add(cartData.items["products"][i]);
            }
            if (cartData.items["products"][i]["category"] == "fragrances") {
              fragrances.add(cartData.items["products"][i]);
            }
            if (cartData.items["products"][i]["category"] == "skincare") {
              skincare.add(cartData.items["products"][i]);
            }
            if (cartData.items["products"][i]["category"] ==
                "home-decoration") {
              homeDecoration.add(cartData.items["products"][i]);
            }
          }
          var selectedData = [];
          if (widget.selectedFilterIndex == 0) {
            selectedData = cartData.items["products"];
          } else if (widget.selectedFilterIndex == 1) {
            selectedData = groceries;
          } else if (widget.selectedFilterIndex == 2) {
            selectedData = smartphones;
          } else if (widget.selectedFilterIndex == 3) {
            selectedData = laptops;
          } else if (widget.selectedFilterIndex == 4) {
            selectedData = fragrances;
          } else if (widget.selectedFilterIndex == 5) {
            selectedData = skincare;
          } else if (widget.selectedFilterIndex == 6) {
            selectedData = homeDecoration;
          } else if (widget.selectedFilterIndex == 7) {
            selectedData = furniture;
          }

          return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 25,
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: selectedData.length,
              itemBuilder: (context, index) {
                final item = selectedData[index];
                return Container(
                  height: ksize.height * 0.18,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ksize.width * .3,
                        child: Image.network(
                          item["images"][0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: ksize.width * 0.55,
                            child: Text(
                              item["title"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ksize.height * 0.01,
                          ),
                          Text(
                            item["category"],
                            style: const TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: ksize.height * 0.01,
                          ),
                          Text(
                            "${item["rating"]}",
                          ),
                          SizedBox(
                            height: ksize.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${item["price"]}",
                                style: const TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: ksize.width * 0.2,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (cartedItems.contains(item)) {
                                      cartedItems.remove(item);
                                    } else {
                                      cartedItems.add(item);
                                    }
                                    widget.cartedItemsList(cartedItems);
                                  });
                                  final cartAddedSnackBar = SnackBar(
                                    content: Text(
                                        'You have added ${item["title"]} to the cart'),
                                  );
                                  final cartRemoveSnackBar = SnackBar(
                                    content: Text(
                                        'You have Removed ${item["title"]} to the cart'),
                                  );
                                  // Show the appropriate snackbar based on the new value of item["isCarted"].
                                  if (cartedItems.contains(item)) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(cartAddedSnackBar);
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(cartRemoveSnackBar);
                                  }
                                },
                                icon: cartedItems.contains(item)
                                    ? const Icon(Icons.shopping_bag)
                                    : const Icon(Icons.shopping_bag_outlined),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              });
        } else {
          return const Center(
            child: Text("Failed to Load content, please try again later."),
          );
        }
      },
    );
  }
}
