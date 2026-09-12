import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'products_event.freezed.dart';

@freezed
sealed class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.loadRequested() = ProductsLoadRequested;

  const factory ProductsEvent.searchQueryChanged({
    required String query,
  }) = ProductsSearchQueryChanged;

  const factory ProductsEvent.categorySelected({
    ProductCategory? category,
  }) = ProductsCategorySelected;
}