import 'package:final_project/src/application/cartPage/bloc/cart_page_bloc_bloc.dart';
import 'package:final_project/src/domain/model/cart_model/cart_fetch_model.dart';
import 'package:final_project/src/presentation/core/images/constant_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPageListPageWidget extends StatefulWidget {
  const CartPageListPageWidget({super.key});

  @override
  State<CartPageListPageWidget> createState() => _CartPageListPageWidgetState();
}

class _CartPageListPageWidgetState extends State<CartPageListPageWidget> {
  final List<Map<String, dynamic>> itemsList = [
    {"name": "one", "category": "phone", "price": "20"},
    {"name": "one", "category": "phone", "price": "20"},
    {"name": "one", "category": "phone", "price": "20"},
    {"name": "one", "category": "phone", "price": "20"},
    {"name": "one", "category": "phone", "price": "20"},
  ];
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
    return SizedBox(
      height: ksize.height,
      child: BlocBuilder<CartPageBlocBloc, CartPageBlocState>(
        builder: (context, state) {
          List<CartModel> cartData = state.productData;
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 25,
              );
            },
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: cartData.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(ConstantImages.image1),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartData[index].title!,
                          // itemsList[index]["name"],
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
                    )
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
