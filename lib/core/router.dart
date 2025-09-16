import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:syncc/core/routes.dart';
import 'package:syncc/view/artist/artist_signup_screen.dart';
import 'package:syncc/view/auth/auth_choice_screen.dart';
import 'package:syncc/view/auth/verification_screen.dart';
import 'package:syncc/view/producer/producer_signup_screen.dart';
import 'package:syncc/view/splash/splash_screen.dart';

import '../view/error/error_screen.dart';

/// Simple router configuration for the Syncc app
class ModernRouter {
  // Private constructor to prevent instantiation
  ModernRouter._();

  /// Main router configuration
  static final GoRouter router = GoRouter(
    initialLocation: ModernRoutes.root,
    debugLogDiagnostics: kDebugMode,
    // Web-specific configuration for instant navigation
    routerNeglect: kIsWeb,
    // Instant navigation for web feel
    redirect: (context, state) {
      // No redirects for instant navigation
      return null;
    },
    routes: [
      GoRoute(
        path: ModernRoutes.root,
        name: '/',
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: ModernRoutes.authChoice,
        name: 'auth-choice',
        builder: (context, state) => const AuthChoiceScreen(),
      ),
      GoRoute(
        path: ModernRoutes.artistSignupScreen,
        name: 'signup-music-artist',
        builder: (context, state) => const ArtistSignupScreen(),
      ),
      GoRoute(
        path: ModernRoutes.producerSignupScreen,
        name: 'signup-film-producers',
        builder: (context, state) => const ProducerSignupScreen(),
      ),
      GoRoute(
        path: ModernRoutes.verificationScreen("code"),
        name: 'verification',
        builder: (context, state) => VerificationScreen(
          countryCode: state.pathParameters["code"] ?? "NG",
        ),
      ),
    ],

    // Error handling
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
