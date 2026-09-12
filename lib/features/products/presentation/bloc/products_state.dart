import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'products_state.freezed.dart';

@freezed
sealed class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = ProductsInitial;

  const factory ProductsState.loading() = ProductsLoading;

  const factory ProductsState.success({
    required List<Product> allProducts,
    required List<Product> products,
    @Default('') String searchQuery,
    ProductCategory? selectedCategory,
  }) = ProductsSuccess;

  const factory ProductsState.empty() = ProductsEmpty;

  const factory ProductsState.failure({
    required String message,
  }) = ProductsFailure;
}