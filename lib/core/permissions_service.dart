import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

/// Service for managing app permissions across platforms
///
/// This service handles runtime permission requests for file access,
/// camera, microphone, and other features required by the app.
class PermissionsService {
  static final PermissionsService _instance = PermissionsService._();

  static PermissionsService get instance => _instance;

  PermissionsService._();

  /// Check if storage permission is granted
  Future<bool> hasStoragePermission() async {
    if (kIsWeb) return true; // Web doesn't need storage permissions

    // For Android 13+ (API 33+), use granular media permissions
    if (defaultTargetPlatform == TargetPlatform.android) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        // Use granular media permissions for Android 13+
        final audioPermission = await Permission.audio.status;
        final photosPermission = await Permission.photos.status;
        return audioPermission.isGranted && photosPermission.isGranted;
      } else {
        // Use legacy storage permissions for older Android versions
        final storagePermission = await Permission.storage.status;
        return storagePermission.isGranted;
      }
    }

    // For iOS/macOS, check photo library permission
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      final photosPermission = await Permission.photos.status;
      return photosPermission.isGranted;
    }

    // For other platforms, assume permission is granted
    return true;
  }

  /// Request storage permission
  Future<bool> requestStoragePermission() async {
    if (kIsWeb) return true; // Web doesn't need storage permissions

    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          // Request granular media permissions for Android 13+
          final audioResult = await Permission.audio.request();
          final photosResult = await Permission.photos.request();
          return audioResult.isGranted && photosResult.isGranted;
        } else {
          // Request legacy storage permission for older Android versions
          final result = await Permission.storage.request();
          return result.isGranted;
        }
      }

      if (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS) {
        final result = await Permission.audio.request();
        print(result);
        return result.isGranted;
      }

      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Error requesting storage permission: $e');
      }
      return false;
    }
  }

  /// Check if camera permission is granted
  Future<bool> hasCameraPermission() async {
    if (kIsWeb) return true; // Web handles camera permission differently

    try {
      final result = await Permission.camera.status;
      return result.isGranted;
    } catch (e) {
      if (kDebugMode) {
        print('Error checking camera permission: $e');
      }
      return false;
    }
  }

  /// Request camera permission
  Future<bool> requestCameraPermission() async {
    if (kIsWeb) return true; // Web handles camera permission differently

    try {
      final result = await Permission.camera.request();
      return result.isGranted;
    } catch (e) {
      if (kDebugMode) {
        print('Error requesting camera permission: $e');
      }
      return false;
    }
  }

  /// Check if microphone permission is granted
  Future<bool> hasMicrophonePermission() async {
    if (kIsWeb) return true; // Web handles microphone permission differently

    try {
      final result = await Permission.microphone.status;
      return result.isGranted;
    } catch (e) {
      if (kDebugMode) {
        print('Error checking microphone permission: $e');
      }
      return false;
    }
  }

  /// Request microphone permission
  Future<bool> requestMicrophonePermission() async {
    if (kIsWeb) return true; // Web handles microphone permission differently

    try {
      final result = await Permission.microphone.request();
      return result.isGranted;
    } catch (e) {
      if (kDebugMode) {
        print('Error requesting microphone permission: $e');
      }
      return false;
    }
  }

  /// Check if all required permissions are granted
  Future<bool> hasAllRequiredPermissions() async {
    final storage = await hasStoragePermission();
    final camera = await hasCameraPermission();
    final microphone = await hasMicrophonePermission();

    return storage && camera && microphone;
  }

  /// Request all required permissions
  Future<bool> requestAllRequiredPermissions() async {
    final storage = await requestStoragePermission();
    final camera = await requestCameraPermission();
    final microphone = await requestMicrophonePermission();

    return storage && camera && microphone;
  }

  /// Open app settings for manual permission management
  Future<void> openAppSettings() async {
    try {
      await openAppSettings();
    } catch (e) {
      if (kDebugMode) {
        print('Error opening app settings: $e');
      }
    }
  }

  /// Get permission status for a specific permission
  Future<PermissionStatus> getPermissionStatus(Permission permission) async {
    try {
      return await permission.status;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting permission status: $e');
      }
      return PermissionStatus.denied;
    }
  }

  /// Request a specific permission
  Future<PermissionStatus> requestPermission(Permission permission) async {
    try {
      return await permission.request();
    } catch (e) {
      if (kDebugMode) {
        print('Error requesting permission: $e');
      }
      return PermissionStatus.denied;
    }
  }
}
