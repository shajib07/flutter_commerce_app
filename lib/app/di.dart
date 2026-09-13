import 'package:get_it/get_it.dart';

import '../features/products/data/repositories/mock_product_repository.dart';
import '../features/products/domain/repositories/product_repository.dart';
import '../features/products/presentation/product_list/bloc/products_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<ProductRepository>(
    () => const MockProductRepository(),
  );

  getIt.registerFactory<ProductsBloc>(
    () => ProductsBloc(productRepository: getIt<ProductRepository>()),
  );
}
