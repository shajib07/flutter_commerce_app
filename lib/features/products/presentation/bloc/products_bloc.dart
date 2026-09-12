import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import 'products_event.dart';
import 'products_state.dart';

final class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(const ProductsState.initial()) {
    on<ProductsLoadRequested>(_onLoadRequested);
    on<ProductsSearchQueryChanged>(_onSearchQueryChanged);
    on<ProductsCategorySelected>(_onCategorySelected);
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

      emit(ProductsState.success(allProducts: products, products: products));
    } on Exception {
      emit(
        const ProductsState.failure(
          message: 'We couldn’t load products. Please try again.',
        ),
      );
    }
  }

  void _onSearchQueryChanged(
    ProductsSearchQueryChanged event,
    Emitter<ProductsState> emit,
  ) {
    final currentState = state;

    if (currentState is! ProductsSuccess) {
      return;
    }

    emit(
      currentState.copyWith(
        searchQuery: event.query,
        products: _filterProducts(
          products: currentState.allProducts,
          query: event.query,
          category: currentState.selectedCategory,
        ),
      ),
    );
  }

  void _onCategorySelected(
    ProductsCategorySelected event,
    Emitter<ProductsState> emit,
  ) {
    final currentState = state;

    if (currentState is! ProductsSuccess) {
      return;
    }

    emit(
      currentState.copyWith(
        selectedCategory: event.category,
        products: _filterProducts(
          products: currentState.allProducts,
          query: currentState.searchQuery,
          category: event.category,
        ),
      ),
    );
  }

  List<Product> _filterProducts({
    required List<Product> products,
    required String query,
    required ProductCategory? category,
  }) {
    final normalizedQuery = query.trim().toLowerCase();

    return products
        .where((product) {
          final matchesQuery =
              normalizedQuery.isEmpty ||
              product.title.toLowerCase().contains(normalizedQuery) ||
              product.brand.toLowerCase().contains(normalizedQuery);

          final matchesCategory =
              category == null || product.category == category;

          return matchesQuery && matchesCategory;
        })
        .toList(growable: false);
  }
}
