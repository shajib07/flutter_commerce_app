sealed class ProductException implements Exception {
  const ProductException();
}

final class ProductLoadException extends ProductException {
  const ProductLoadException();

  @override
  String toString() => 'Products could not be loaded.';
}

final class ProductNotFoundException extends ProductException {
  const ProductNotFoundException(this.productId);

  final String productId;

  @override
  String toString() => 'Product $productId was not found.';
}
