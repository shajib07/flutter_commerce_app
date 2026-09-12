import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../bloc/products_bloc.dart';
import '../bloc/products_event.dart';
import '../bloc/products_state.dart';

final class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shoply')),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return switch (state) {
            ProductsInitial() => const _LoadingView(),
            ProductsLoading() => const _LoadingView(),
            ProductsSuccess(
              products: final products,
              searchQuery: final searchQuery,
              selectedCategory: final selectedCategory,
            ) =>
              _ProductsContent(
                products: products,
                searchQuery: searchQuery,
                selectedCategory: selectedCategory,
              ),
            ProductsEmpty() => const _StateMessage(
              icon: Icons.inventory_2_outlined,
              title: 'No products found',
              message: 'New products will appear here when they are available.',
            ),
            ProductsFailure(message: final message) => _StateMessage(
              icon: Icons.cloud_off_outlined,
              title: 'Something went wrong',
              message: message,
              retryLabel: 'Try again',
              onRetry: () {
                context.read<ProductsBloc>().add(
                  const ProductsEvent.loadRequested(),
                );
              },
            ),
          };
        },
      ),
    );
  }
}

final class _ProductsContent extends StatelessWidget {
  const _ProductsContent({
    required this.products,
    required this.searchQuery,
    required this.selectedCategory,
  });

  final List<Product> products;
  final String searchQuery;
  final ProductCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: TextField(
            onChanged: (query) {
              context.read<ProductsBloc>().add(
                ProductsEvent.searchQueryChanged(query: query),
              );
            },
            decoration: InputDecoration(
              hintText: 'Search products or brands',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: colorScheme.surface,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: colorScheme.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: colorScheme.primary, width: 2),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 48,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: [
              ChoiceChip(
                label: const Text('All'),
                selected: selectedCategory == null,
                onSelected: (selected) {
                  if (!selected) {
                    return;
                  }

                  context.read<ProductsBloc>().add(
                    const ProductsEvent.categorySelected(),
                  );
                },
              ),
              const SizedBox(width: 8),
              for (final category in ProductCategory.values) ...[
                ChoiceChip(
                  label: Text(_categoryLabel(category)),
                  selected: selectedCategory == category,
                  onSelected: (selected) {
                    if (!selected) {
                      return;
                    }

                    context.read<ProductsBloc>().add(
                      ProductsEvent.categorySelected(category: category),
                    );
                  },
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
        Expanded(
          child: products.isEmpty
              ? const _StateMessage(
                  icon: Icons.search_off_outlined,
                  title: 'No matching products',
                  message: 'Try another search or choose a different category.',
                )
              : _ProductList(products: products),
        ),
      ],
    );
  }
}

String _categoryLabel(ProductCategory category) {
  return switch (category) {
    ProductCategory.electronics => 'Electronics',
    ProductCategory.fashion => 'Fashion',
    ProductCategory.home => 'Home',
    ProductCategory.beauty => 'Beauty',
    ProductCategory.sports => 'Sports',
  };
}

final class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading products…'),
        ],
      ),
    );
  }
}

final class _ProductList extends StatelessWidget {
  const _ProductList({required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _ProductCard(product: products[index]);
      },
    );
  }
}

final class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 96,
              height: 112,
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 36,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.brand.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _formatPrice(product),
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(Product product) {
    final amount = product.priceInCents / 100;
    return '${product.currencyCode} ${amount.toStringAsFixed(2)}';
  }
}

final class _StateMessage extends StatelessWidget {
  const _StateMessage({
    required this.icon,
    required this.title,
    required this.message,
    this.retryLabel,
    this.onRetry,
  });

  final IconData icon;
  final String title;
  final String message;
  final String? retryLabel;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 52, color: colorScheme.primary),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            if (onRetry != null && retryLabel != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(retryLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
