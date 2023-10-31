import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_fetch_model.freezed.dart';
part 'cart_fetch_model.g.dart';

@freezed
class CartModel with _$CartModel {
  factory CartModel({
     int? id,
     String? title,
     String? description,
     int? price,
     int? discountPercentage,
     int? rating,
     int? stock,
     String? brand,
     String? category,
     String? thumbnail,
     List<String>? images,
  }) = _CartModel;
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
