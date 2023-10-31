import 'dart:developer';

import 'package:final_project/app/services/api_service.dart';
import 'package:final_project/src/domain/model/cart_model/cart_fetch_model.dart';
import 'package:final_project/src/domain/repositories/i_cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICartRepository)
class CartRepository implements ICartRepository {
  final Api api;
  CartRepository(this.api);

  @override
  Future<CartModel> cartFetchData() async {
    try {
      final response = await api.call.get("?limit=100");
      log(response.data);
      return CartModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
