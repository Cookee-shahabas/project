
import 'package:final_project/src/domain/model/cart_model/cart_fetch_model.dart';

abstract class ICartRepository{
  Future<CartModel> cartFetchData();
}