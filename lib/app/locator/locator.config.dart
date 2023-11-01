// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:final_project/src/application/cartPage/bloc/cart_page_bloc_bloc.dart'
    as _i5;
import 'package:final_project/src/domain/repositories/i_cart_repository.dart'
    as _i3;
import 'package:final_project/src/insfrastructure/cart_repository.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ICartRepository>(() => _i4.CartRepository());
    gh.factory<_i5.CartPageBlocBloc>(
        () => _i5.CartPageBlocBloc(gh<_i3.ICartRepository>()));
    return this;
  }
}
