import 'package:final_project/app/locator/locator.dart';
import 'package:final_project/src/application/cartPage/bloc/cart_page_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> kBlocProviders = [
  BlocProvider<CartPageBlocBloc>(create: (ctx) => getIt<CartPageBlocBloc>())
];
