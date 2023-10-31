part of 'cart_page_bloc_bloc.dart';

@freezed
class CartPageBlocState with _$CartPageBlocState {
  factory CartPageBlocState({
    required Status cartPageState,
    required CartModel? productData,
  }) = _CartPageBlocState;

  factory CartPageBlocState.initial() => CartPageBlocState(
        cartPageState: const StatusInitial(),
        productData: null,
      );
}
