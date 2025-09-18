import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:afrosync/core/theme.dart';
import 'package:afrosync/core/router.dart';
import 'package:afrosync/core/web_performance.dart';
import 'package:afrosync/controller/audio/audio_service.dart';

import 'api/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize API service
  ApiService.instance.initialize();

  // Initialize audio service
  await AudioService.instance.initialize();

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
