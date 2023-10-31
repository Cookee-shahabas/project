// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:final_project/app/services/api_service.dart' as _i3;
import 'package:final_project/src/application/cartPage/bloc/cart_page_bloc_bloc.dart'
    as _i6;
import 'package:final_project/src/domain/repositories/i_cart_repository.dart'
    as _i4;
import 'package:final_project/src/insfrastructure/cart_repository.dart' as _i5;
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
    gh.lazySingleton<_i3.Api>(() => _i3.Api());
    gh.lazySingleton<_i4.ICartRepository>(
        () => _i5.CartRepository(gh<_i3.Api>()));
    gh.factory<_i6.CartPageBlocBloc>(
        () => _i6.CartPageBlocBloc(gh<_i4.ICartRepository>()));
    return this;
  }
}
