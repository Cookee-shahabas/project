import 'dart:developer';

import 'package:final_project/app/constants/status.dart';
import 'package:final_project/src/application/cartPage/bloc/cart_page_bloc_bloc.dart';
import 'package:final_project/src/domain/model/cart_model/cart_fetch_model.dart';
import 'package:final_project/src/insfrastructure/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPageListPageWidget extends StatefulWidget {
  CartPageListPageWidget({super.key, required this.selectedFilterIndex});
  int selectedFilterIndex = 0;
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
          log(cartData.items["products"][0].toString(),
              name: "this is the items ");
          final groceries = [];
          final furniture = [];
          final smartphones = [];
          log(groceries.toString(), name: "groceries");
          for (int i = 0; i < 100; i++) {
            if (cartData.items["products"] != null &&
                cartData.items["products"][i]["category"] == "groceries") {
              groceries.add(cartData.items["products"][i]);
              // log(cartData.items[i]["products"][i]);
            }
            if (cartData.items["products"] != null &&
                cartData.items["products"][i]["category"] == "furniture") {
              furniture.add(cartData.items["products"][i]);
            }
            if (cartData.items["products"][i]["category"] == "smartphones") {
              smartphones.add(cartData.items["products"][i]);
            }
          }
          log(groceries.toString());
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 25,
              );
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 100,
            itemBuilder: (context, index) {
              return Container(
                height: ksize.height * 0.15,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: ksize.width * .3,
                      child: Image.network(
                        cartData.items["products"][index]["images"][0],
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
                            cartData.items["products"][index]["title"],
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
                          cartData.items["products"][index]["category"],
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
                              "\$${cartData.items["products"][index]["price"]}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            // const Icon(Icons.favorite_outline)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text("Failed to Load content, please try again later."),
          );
        }
      },
    );
  }
}
