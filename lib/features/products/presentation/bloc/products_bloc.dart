import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/product_repository.dart';
import 'products_event.dart';
import 'products_state.dart';

final class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(const ProductsState.initial()) {
    on<ProductsLoadRequested>(_onLoadRequested);
  }

  final ProductRepository _productRepository;

  Future<void> _onLoadRequested(
    ProductsLoadRequested event,
    Emitter<ProductsState> emit,
  ) async {
    emit(const ProductsState.loading());

    try {
      final products = await _productRepository.getProducts();

      if (products.isEmpty) {
        emit(const ProductsState.empty());
        return;
      }

      emit(ProductsState.success(products: products));
    } on Exception {
      emit(
        const ProductsState.failure(
          message: 'We couldn’t load products. Please try again.',
        ),
      );
    }
  }
}
