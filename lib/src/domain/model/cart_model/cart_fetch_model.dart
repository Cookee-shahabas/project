
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_fetch_model.freezed.dart';
part 'cart_fetch_model.g.dart';
@freezed
class CartModel with _$CartModel{
  factory CartModel({
    required int id,
    required String title,
    required String description,
    required int price,
    required int discountPercentage,
    required int rating, 
    required int stock,
    required String brand,
    required String category,
    required String thumbnail,
    required List images,
  })= _CartModel;
  factory CartModel.fromJson(Map<String,dynamic> json) => _$CartModelFromJson(json);
}