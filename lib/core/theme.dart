import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncc/core/color.dart';

class ModernTheme {
  static final ThemeData appTheme = ThemeData(
    fontFamily: 'FormaDJR',
    colorScheme: ColorScheme.fromSeed(
      seedColor: ModernColors.primary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: ModernColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: ModernColors.background,
      surfaceTintColor: Colors.transparent,
      // Instant app bar transitions
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
    ),

    // Alternative approach - more concise and readable
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        // Web override for all platforms
        if (kIsWeb) ...{
          for (final platform in TargetPlatform.values)
            platform: const InstantPageTransitionsBuilder(),
        }
        // Platform-specific transitions when not on web
        else ...{
          TargetPlatform.android: const FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: const CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: const FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: const FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.fuchsia: const FadeUpwardsPageTransitionsBuilder(),
        },
      },
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 60,
        fontWeight: FontWeight.w700,
        height: 0.9,
        letterSpacing: 0,
      ),
      displayMedium: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: 'FormaDJR',
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

/// Instant transition builder for web-like feel
class InstantPageTransitionsBuilder extends PageTransitionsBuilder {
  const InstantPageTransitionsBuilder();

  @override
  Widget buildTransitions<T extends Object?>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Return child immediately for instant transitions
    return child;
  }
}
