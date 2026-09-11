import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_event.freezed.dart';

@freezed
sealed class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.loadRequested() = ProductsLoadRequested;
}
