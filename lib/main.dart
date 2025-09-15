import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:syncc/core/theme.dart';
import 'package:syncc/core/router.dart';
import 'package:syncc/core/web_performance.dart';

void main() {
  runApp(const SynccApp());
}

class SynccApp extends StatelessWidget {
  const SynccApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Syncc',
      debugShowCheckedModeBanner: false,
      theme: ModernTheme.appTheme,
      themeMode: ThemeMode.system,
      routerConfig: ModernRouter.router,
      // Web-specific scroll behavior
      scrollBehavior: kIsWeb ? WebScrollBehavior() : null,
    );
  }
}
