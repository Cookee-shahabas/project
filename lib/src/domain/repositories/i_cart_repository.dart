import 'package:final_project/src/insfrastructure/cart_repository.dart';

abstract class ICartRepository {
  Future<CartModelSample> cartFetchData();
}
