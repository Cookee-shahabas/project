part of 'cart_page_bloc_bloc.dart';

@freezed
class CartPageBlocEvent with _$CartPageBlocEvent {
  const factory CartPageBlocEvent.started() = _Started;
}