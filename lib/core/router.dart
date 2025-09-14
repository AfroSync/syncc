import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:syncc/core/routes.dart';
import 'package:syncc/view/splash/splash_screen.dart';

/// Simple router configuration for the Syncc app
class AppRouter {
  // Private constructor to prevent instantiation
  AppRouter._();

  /// Main router configuration
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: kDebugMode,
    // Web-specific configuration
    routerNeglect: kIsWeb,
    routes: [
      // Splash screen
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
    ],

    // Error handling
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}
