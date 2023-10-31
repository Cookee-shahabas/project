import 'dart:async';
import 'dart:developer';

import 'package:final_project/app/constants/status.dart';
import 'package:final_project/src/domain/model/cart_model/cart_fetch_model.dart';
import 'package:final_project/src/domain/repositories/i_cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cart_page_bloc_event.dart';
part 'cart_page_bloc_state.dart';
part 'cart_page_bloc_bloc.freezed.dart';

@injectable
class CartPageBlocBloc extends Bloc<CartPageBlocEvent, CartPageBlocState> {
  final ICartRepository cartRepository;
  CartPageBlocBloc(this.cartRepository) : super(CartPageBlocState.initial()) {
    on<_CartPageData>(_cartPageData);
  }

  FutureOr<void> _cartPageData(event, Emitter<CartPageBlocState> emit) async {
    try {
      log("inside the cartpage bloc");
      emit(state.copyWith(cartPageState: StatusLoading()));
      var response = await cartRepository.cartFetchData();
      log(response.toString(), name: "this is inside of the cart bloc");
      emit(state.copyWith(
          cartPageState: StatusSuccess(),
          productData: response as List<CartModel>));
    } catch (e) {
      emit(state.copyWith(cartPageState: StatusFailure(e.toString())));
    }
  }
}
