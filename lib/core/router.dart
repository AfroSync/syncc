import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:syncc/core/routes.dart';
import 'package:syncc/view/auth/artist_signup_screen.dart';
import 'package:syncc/view/auth/auth_choice_screen.dart';
import 'package:syncc/view/auth/login_screen.dart';
import 'package:syncc/view/auth/verification_screen.dart';
import 'package:syncc/view/home_widget.dart';
import 'package:syncc/view/auth/producer_signup_screen.dart';
import 'package:syncc/view/splash/splash_screen.dart';
import 'package:syncc/view/license/license_contract_screen.dart';
import 'package:syncc/view/license/license_payment_screen.dart';
import 'package:syncc/model/track_model.dart';
import 'package:syncc/model/license_model.dart';

import '../view/widget/error_screen.dart';

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
        path: ModernRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
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
      GoRoute(
        path: ModernRoutes.home,
        name: 'home',
        builder: (context, state) => const HomeWidget(),
        routes: [
          GoRoute(
            path: ModernRoutes.profile,
            name: 'profile',
            builder: (context, state) =>
                const HomeWidget(defaultTab: TabView.profile),
          ),
          GoRoute(
            path: ModernRoutes.catalog,
            name: 'catalog',
            builder: (context, state) =>
                const HomeWidget(defaultTab: TabView.catalog),
          ),
          GoRoute(
            path: ModernRoutes.license,
            name: 'license',
            builder: (context, state) =>
                const HomeWidget(defaultTab: TabView.license),
          ),
        ],
      ),

      // License contract route
      GoRoute(
        path: '/license/contract/:trackId',
        name: 'license-contract',
        builder: (context, state) {
          final trackIdString = state.pathParameters['trackId'] ?? '1';
          final trackId = int.tryParse(trackIdString) ?? 1;
          // For now, create a dummy track model with the trackId
          // In a real app, you'd fetch the track from an API or pass it through extra
          final track = TrackModel(id: trackId);
          return LicenseContractScreen(track);
        },
      ),

      // License payment route
      GoRoute(
        path: '/license/payment/:licenseId',
        name: 'license-payment',
        builder: (context, state) {
          final licenseId = state.pathParameters['licenseId'] ?? '1';
          // For now, create a dummy license model with the licenseId
          // In a real app, you'd fetch the license from an API using licenseId
          // TODO: Use licenseId to fetch actual license data
          final license = LicenseModel();
          // Using licenseId in debug mode to avoid unused variable warning
          assert(licenseId.isNotEmpty, 'License ID should not be empty');
          return LicensePaymentScreen(license);
        },
      ),
    ],

    // Error handling
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
