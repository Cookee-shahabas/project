import 'dart:convert';
import 'package:final_project/src/domain/repositories/i_cart_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: ICartRepository)
class CartRepository implements ICartRepository {
  CartRepository();

  @override
  Future<CartModelSample> cartFetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));
      final Map<String, dynamic> data = json.decode(response.body);
      return CartModelSample(items: data);
    } catch (e) {
      rethrow;
    }
  }
}

class CartModelSample {
  final Map<String, dynamic> items;
  CartModelSample({required this.items});
}
