import 'package:get_it/get_it.dart';
import 'package:afrosync/controller/audio/audio_state.dart';
import 'package:afrosync/controller/audio/audio_service.dart';
import 'package:afrosync/controller/track/track_creation_service.dart';
import 'package:afrosync/api/api_service.dart';
import 'package:afrosync/core/permissions_service.dart';
import 'package:afrosync/core/pdf_service.dart';

/// Service locator for dependency injection
///
/// This helps manage singleton instances and maintain state across the app
final GetIt sl = GetIt.instance;

/// Initialize all services and dependencies
Future<void> initializeServices() async {
  // Register AudioStateManager as a singleton
  sl.registerLazySingleton<AudioStateManager>(() => AudioStateManager.instance);

  // Register AudioService as a singleton
  sl.registerLazySingleton<AudioService>(() => AudioService.instance);

  // Register TrackCreationService as a singleton
  sl.registerLazySingleton<TrackCreationService>(
    () => TrackCreationService.instance,
  );

  // Register ApiService as a singleton
  sl.registerLazySingleton<ApiService>(() => ApiService.instance);

  // Register PermissionsService as a singleton
  sl.registerLazySingleton<PermissionsService>(
    () => PermissionsService.instance,
  );

  // Register PdfService as a singleton
  sl.registerLazySingleton<PdfService>(() => PdfService.instance);

  // Initialize the audio service
  await sl<AudioService>().initialize();
}

/// Dispose all services when app is closing
Future<void> disposeServices() async {
  sl<AudioService>().dispose();
  await sl.reset();
}
