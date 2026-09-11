import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

enum ProductCategory {
  electronics,
  fashion,
  home,
  beauty,
  sports,
}

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String title,
    required String brand,
    required String description,
    required ProductCategory category,
    required int priceInCents,
    required String currencyCode,
  }) = _Product;
}