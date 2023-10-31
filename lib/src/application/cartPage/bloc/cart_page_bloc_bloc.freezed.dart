// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_page_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartPageBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartpageData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartpageData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartpageData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartPageData value) cartpageData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartPageData value)? cartpageData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartPageData value)? cartpageData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartPageBlocEventCopyWith<$Res> {
  factory $CartPageBlocEventCopyWith(
          CartPageBlocEvent value, $Res Function(CartPageBlocEvent) then) =
      _$CartPageBlocEventCopyWithImpl<$Res, CartPageBlocEvent>;
}

/// @nodoc
class _$CartPageBlocEventCopyWithImpl<$Res, $Val extends CartPageBlocEvent>
    implements $CartPageBlocEventCopyWith<$Res> {
  _$CartPageBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CartPageDataImplCopyWith<$Res> {
  factory _$$CartPageDataImplCopyWith(
          _$CartPageDataImpl value, $Res Function(_$CartPageDataImpl) then) =
      __$$CartPageDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartPageDataImplCopyWithImpl<$Res>
    extends _$CartPageBlocEventCopyWithImpl<$Res, _$CartPageDataImpl>
    implements _$$CartPageDataImplCopyWith<$Res> {
  __$$CartPageDataImplCopyWithImpl(
      _$CartPageDataImpl _value, $Res Function(_$CartPageDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CartPageDataImpl implements _CartPageData {
  const _$CartPageDataImpl();

  @override
  String toString() {
    return 'CartPageBlocEvent.cartpageData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartPageDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartpageData,
  }) {
    return cartpageData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartpageData,
  }) {
    return cartpageData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartpageData,
    required TResult orElse(),
  }) {
    if (cartpageData != null) {
      return cartpageData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartPageData value) cartpageData,
  }) {
    return cartpageData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartPageData value)? cartpageData,
  }) {
    return cartpageData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartPageData value)? cartpageData,
    required TResult orElse(),
  }) {
    if (cartpageData != null) {
      return cartpageData(this);
    }
    return orElse();
  }
}

abstract class _CartPageData implements CartPageBlocEvent {
  const factory _CartPageData() = _$CartPageDataImpl;
}

/// @nodoc
mixin _$CartPageBlocState {
  Status get cartPageState => throw _privateConstructorUsedError;
  List<CartModel> get productData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartPageBlocStateCopyWith<CartPageBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartPageBlocStateCopyWith<$Res> {
  factory $CartPageBlocStateCopyWith(
          CartPageBlocState value, $Res Function(CartPageBlocState) then) =
      _$CartPageBlocStateCopyWithImpl<$Res, CartPageBlocState>;
  @useResult
  $Res call({Status cartPageState, List<CartModel> productData});
}

/// @nodoc
class _$CartPageBlocStateCopyWithImpl<$Res, $Val extends CartPageBlocState>
    implements $CartPageBlocStateCopyWith<$Res> {
  _$CartPageBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartPageState = null,
    Object? productData = null,
  }) {
    return _then(_value.copyWith(
      cartPageState: null == cartPageState
          ? _value.cartPageState
          : cartPageState // ignore: cast_nullable_to_non_nullable
              as Status,
      productData: null == productData
          ? _value.productData
          : productData // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartPageBlocStateImplCopyWith<$Res>
    implements $CartPageBlocStateCopyWith<$Res> {
  factory _$$CartPageBlocStateImplCopyWith(_$CartPageBlocStateImpl value,
          $Res Function(_$CartPageBlocStateImpl) then) =
      __$$CartPageBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status cartPageState, List<CartModel> productData});
}

/// @nodoc
class __$$CartPageBlocStateImplCopyWithImpl<$Res>
    extends _$CartPageBlocStateCopyWithImpl<$Res, _$CartPageBlocStateImpl>
    implements _$$CartPageBlocStateImplCopyWith<$Res> {
  __$$CartPageBlocStateImplCopyWithImpl(_$CartPageBlocStateImpl _value,
      $Res Function(_$CartPageBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartPageState = null,
    Object? productData = null,
  }) {
    return _then(_$CartPageBlocStateImpl(
      cartPageState: null == cartPageState
          ? _value.cartPageState
          : cartPageState // ignore: cast_nullable_to_non_nullable
              as Status,
      productData: null == productData
          ? _value._productData
          : productData // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
    ));
  }
}

/// @nodoc

class _$CartPageBlocStateImpl implements _CartPageBlocState {
  _$CartPageBlocStateImpl(
      {required this.cartPageState, required final List<CartModel> productData})
      : _productData = productData;

  @override
  final Status cartPageState;
  final List<CartModel> _productData;
  @override
  List<CartModel> get productData {
    if (_productData is EqualUnmodifiableListView) return _productData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productData);
  }

  @override
  String toString() {
    return 'CartPageBlocState(cartPageState: $cartPageState, productData: $productData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartPageBlocStateImpl &&
            (identical(other.cartPageState, cartPageState) ||
                other.cartPageState == cartPageState) &&
            const DeepCollectionEquality()
                .equals(other._productData, _productData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartPageState,
      const DeepCollectionEquality().hash(_productData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartPageBlocStateImplCopyWith<_$CartPageBlocStateImpl> get copyWith =>
      __$$CartPageBlocStateImplCopyWithImpl<_$CartPageBlocStateImpl>(
          this, _$identity);
}

abstract class _CartPageBlocState implements CartPageBlocState {
  factory _CartPageBlocState(
      {required final Status cartPageState,
      required final List<CartModel> productData}) = _$CartPageBlocStateImpl;

  @override
  Status get cartPageState;
  @override
  List<CartModel> get productData;
  @override
  @JsonKey(ignore: true)
  _$$CartPageBlocStateImplCopyWith<_$CartPageBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
