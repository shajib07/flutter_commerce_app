import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

enum MockProductScenario { success, empty, failure }

final class MockProductRepository implements ProductRepository {
  const MockProductRepository({
    this.scenario = MockProductScenario.success,
    this.delay = const Duration(milliseconds: 700),
  });

  final MockProductScenario scenario;
  final Duration delay;

  @override
  Future<List<Product>> getProducts() async {
    await Future<void>.delayed(delay);

    return switch (scenario) {
      MockProductScenario.success => List<Product>.unmodifiable(_products),
      MockProductScenario.empty => const <Product>[],
      MockProductScenario.failure => throw const ProductLoadException(),
    };
  }
}

final class ProductLoadException implements Exception {
  const ProductLoadException();

  @override
  String toString() => 'Products could not be loaded.';
}

const _products = <Product>[
  Product(
    id: 'product-001',
    title: 'Pulse Wireless Headphones',
    brand: 'Sonora',
    description:
        'Comfortable over-ear headphones with balanced sound, active noise '
        'cancellation, and up to 30 hours of battery life.',
    category: ProductCategory.electronics,
    priceInCents: 12999,
    currencyCode: 'USD',
  ),
  Product(
    id: 'product-002',
    title: 'Frame Mechanical Keyboard',
    brand: 'Keyform',
    description:
        'A compact mechanical keyboard with tactile switches, a solid aluminum '
        'frame, and customizable backlighting.',
    category: ProductCategory.electronics,
    priceInCents: 15900,
    currencyCode: 'USD',
  ),
  Product(
    id: 'product-003',
    title: 'North Commuter Jacket',
    brand: 'Arden',
    description:
        'A lightweight, water-resistant jacket designed for changing weather '
        'and everyday city travel.',
    category: ProductCategory.fashion,
    priceInCents: 18900,
    currencyCode: 'USD',
  ),
  Product(
    id: 'product-004',
    title: 'Aster Ceramic Lamp',
    brand: 'Noma Living',
    description:
        'A softly textured ceramic table lamp that adds warm, diffused light '
        'to bedrooms and living spaces.',
    category: ProductCategory.home,
    priceInCents: 8900,
    currencyCode: 'USD',
  ),
  Product(
    id: 'product-005',
    title: 'Renew Hydration Serum',
    brand: 'Luma',
    description:
        'A lightweight daily serum formulated to hydrate the skin without '
        'leaving a heavy or sticky finish.',
    category: ProductCategory.beauty,
    priceInCents: 5400,
    currencyCode: 'USD',
  ),
  Product(
    id: 'product-006',
    title: 'Arc Training Duffel',
    brand: 'Motion',
    description:
        'A durable training bag with a ventilated shoe compartment, internal '
        'organizers, and an adjustable shoulder strap.',
    category: ProductCategory.sports,
    priceInCents: 7400,
    currencyCode: 'USD',
  ),
];
