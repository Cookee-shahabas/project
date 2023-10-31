import 'package:bloc/bloc.dart';
import 'package:final_project/src/domain/model/cart_model/cart_fetch_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_page_bloc_event.dart';
part 'cart_page_bloc_state.dart';
part 'cart_page_bloc_bloc.freezed.dart';

class CartPageBlocBloc extends Bloc<CartPageBlocEvent, CartPageBlocState> {
  CartPageBlocBloc() : super(_Initial()) {
    on<CartPageBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
