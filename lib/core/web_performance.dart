import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Web performance optimization utilities
class WebPerformance {
  // Private constructor to prevent instantiation
  WebPerformance._();

  /// Preload critical assets for web
  static void preloadAssets() {
    if (kIsWeb) {
      // Preload critical fonts
      _preloadFont('Inter-Regular');
      _preloadFont('Inter-Medium');
      _preloadFont('Inter-SemiBold');
      _preloadFont('Inter-Bold');
    }
  }

  /// Preload a font file
  static void _preloadFont(String fontName) {
    if (kIsWeb) {
      // This would be implemented with platform-specific code
      // For now, we'll just log it in debug mode
      if (kDebugMode) {
        print('Preloading font: $fontName');
      }
    }
  }

  /// Optimize images for web
  static String getOptimizedImageUrl(
    String imageUrl, {
    double? width,
    double? height,
  }) {
    if (kIsWeb) {
      // Add web-specific image optimization parameters
      final params = <String>[];
      if (width != null) params.add('w=${width.toInt()}');
      if (height != null) params.add('h=${height.toInt()}');
      params.add('f=webp'); // Use WebP format for better compression
      params.add('q=80'); // Quality setting

      if (params.isNotEmpty) {
        final separator = imageUrl.contains('?') ? '&' : '?';
        return '$imageUrl$separator${params.join('&')}';
      }
    }
    return imageUrl;
  }

  /// Lazy load images for better performance
  static Widget buildLazyImage({
    required String imageUrl,
    required Widget placeholder,
    required Widget errorWidget,
    BoxFit? fit,
    double? width,
    double? height,
  }) {
    if (kIsWeb) {
      // Use optimized image URL for web
      final optimizedUrl = getOptimizedImageUrl(
        imageUrl,
        width: width,
        height: height,
      );

      return Image.network(
        optimizedUrl,
        fit: fit,
        width: width,
        height: height,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return placeholder;
        },
        errorBuilder: (context, error, stackTrace) {
          return errorWidget;
        },
      );
    } else {
      // Use regular image for mobile
      return Image.asset(
        imageUrl,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (context, error, stackTrace) {
          return errorWidget;
        },
      );
    }
  }

  /// Debounce function for web performance
  static void debounce(
    String key,
    VoidCallback callback, {
    Duration delay = const Duration(milliseconds: 300),
  }) {
    if (kIsWeb) {
      // Implement debouncing logic
      _debounceTimers[key]?.cancel();
      _debounceTimers[key] = Timer(delay, callback);
    } else {
      callback();
    }
  }

  static final Map<String, Timer> _debounceTimers = {};

  /// Throttle function for web performance
  static void throttle(
    String key,
    VoidCallback callback, {
    Duration delay = const Duration(milliseconds: 100),
  }) {
    if (kIsWeb) {
      if (!_throttleTimers.containsKey(key)) {
        _throttleTimers[key] = DateTime.now();
        callback();
      } else {
        final now = DateTime.now();
        if (now.difference(_throttleTimers[key]!).compareTo(delay) >= 0) {
          _throttleTimers[key] = now;
          callback();
        }
      }
    } else {
      callback();
    }
  }

  static final Map<String, DateTime> _throttleTimers = {};

  /// Clear all timers (call this when disposing)
  static void clearTimers() {
    for (final timer in _debounceTimers.values) {
      timer.cancel();
    }
    _debounceTimers.clear();
    _throttleTimers.clear();
  }
}

/// Web-specific widget optimizations
class WebOptimizedWidget extends StatefulWidget {
  final Widget child;
  final bool enableLazyLoading;
  final Duration? lazyLoadDelay;

  const WebOptimizedWidget({
    super.key,
    required this.child,
    this.enableLazyLoading = true,
    this.lazyLoadDelay,
  });

  @override
  State<WebOptimizedWidget> createState() => _WebOptimizedWidgetState();
}

class _WebOptimizedWidgetState extends State<WebOptimizedWidget> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    if (kIsWeb && widget.enableLazyLoading) {
      _scheduleLazyLoad();
    } else {
      _isVisible = true;
    }
  }

  void _scheduleLazyLoad() {
    final delay = widget.lazyLoadDelay ?? const Duration(milliseconds: 100);
    Future.delayed(delay, () {
      if (mounted) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      return const SizedBox.shrink();
    }
    return widget.child;
  }
}

/// Web-specific scroll behavior
class WebScrollBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    if (kIsWeb) {
      return Scrollbar(controller: details.controller, child: child);
    }
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    if (kIsWeb) {
      return const BouncingScrollPhysics();
    }
    return super.getScrollPhysics(context);
  }
}

/// Web-specific text selection behavior
class WebTextSelectionBehavior {
  // Web-specific text selection utilities can be added here
  // For now, we'll use the default Flutter behavior
}
