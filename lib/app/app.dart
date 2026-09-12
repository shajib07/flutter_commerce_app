import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/theme/app_theme.dart';
import '../features/products/presentation/bloc/products_bloc.dart';
import '../features/products/presentation/bloc/products_event.dart';
import '../features/products/presentation/pages/product_list_page.dart';
import 'di.dart';

final class ShoplyApp extends StatelessWidget {
  const ShoplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoply',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: BlocProvider<ProductsBloc>(
        create: (_) {
          return getIt<ProductsBloc>()
            ..add(const ProductsEvent.loadRequested());
        },
        child: const ProductListPage(),
      ),
    );
  }
}
