import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

final class ShoplyApp extends StatelessWidget {
  const ShoplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoply',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const Scaffold(body: Center(child: Text('Shoply'))),
    );
  }
}
