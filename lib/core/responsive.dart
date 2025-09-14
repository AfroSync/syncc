import 'package:flutter/material.dart';

/// Responsive design utilities for web and mobile
class Responsive {
  // Private constructor to prevent instantiation
  Responsive._();

  // Breakpoints for different screen sizes
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
  static const double largeDesktopBreakpoint = 1600;

  /// Get screen width
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get screen height
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Check if screen is mobile
  static bool isMobile(BuildContext context) {
    return screenWidth(context) < mobileBreakpoint;
  }

  /// Check if screen is tablet
  static bool isTablet(BuildContext context) {
    final width = screenWidth(context);
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  /// Check if screen is desktop
  static bool isDesktop(BuildContext context) {
    return screenWidth(context) >= tabletBreakpoint;
  }

  /// Check if screen is large desktop
  static bool isLargeDesktop(BuildContext context) {
    return screenWidth(context) >= largeDesktopBreakpoint;
  }

  /// Get responsive padding based on screen size
  static EdgeInsets responsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(24);
    } else {
      return const EdgeInsets.all(32);
    }
  }

  /// Get responsive margin based on screen size
  static EdgeInsets responsiveMargin(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    } else {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    }
  }

  /// Get responsive font size based on screen size
  static double responsiveFontSize(BuildContext context, double baseFontSize) {
    if (isMobile(context)) {
      return baseFontSize;
    } else if (isTablet(context)) {
      return baseFontSize * 1.1;
    } else {
      return baseFontSize * 1.2;
    }
  }

  /// Get responsive column count for grid layouts
  static int responsiveColumns(BuildContext context) {
    if (isMobile(context)) {
      return 1;
    } else if (isTablet(context)) {
      return 2;
    } else if (isDesktop(context)) {
      return 3;
    } else {
      return 4;
    }
  }

  /// Get responsive max width for content
  static double responsiveMaxWidth(BuildContext context) {
    if (isMobile(context)) {
      return double.infinity;
    } else if (isTablet(context)) {
      return 800;
    } else if (isDesktop(context)) {
      return 1200;
    } else {
      return 1600;
    }
  }

  /// Get responsive spacing between elements
  static double responsiveSpacing(BuildContext context) {
    if (isMobile(context)) {
      return 8;
    } else if (isTablet(context)) {
      return 12;
    } else {
      return 16;
    }
  }
}

/// Responsive widget that adapts its child based on screen size
class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? largeDesktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isLargeDesktop(context) && largeDesktop != null) {
      return largeDesktop!;
    } else if (Responsive.isDesktop(context) && desktop != null) {
      return desktop!;
    } else if (Responsive.isTablet(context) && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}

/// Responsive layout builder
class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, BoxConstraints constraints)
  builder;

  const ResponsiveLayoutBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(context, constraints);
      },
    );
  }
}

/// Web-specific utilities
class WebUtils {
  // Private constructor to prevent instantiation
  WebUtils._();

  /// Check if running on web
  static bool get isWeb {
    try {
      return identical(0, 0.0);
    } catch (e) {
      return false;
    }
  }

  /// Get user agent string (web only)
  static String? getUserAgent() {
    if (!isWeb) return null;
    // This would need to be implemented with platform-specific code
    return null;
  }

  /// Check if device has touch capability
  static bool hasTouch(BuildContext context) {
    return MediaQuery.of(context).platformBrightness != Brightness.dark ||
        MediaQuery.of(context).accessibleNavigation;
  }

  /// Get safe area padding for web
  static EdgeInsets getWebSafeArea(BuildContext context) {
    if (!isWeb) return EdgeInsets.zero;

    final mediaQuery = MediaQuery.of(context);
    return EdgeInsets.only(
      top: mediaQuery.padding.top,
      bottom: mediaQuery.padding.bottom,
      left: Responsive.isMobile(context) ? 0 : 16,
      right: Responsive.isMobile(context) ? 0 : 16,
    );
  }
}
