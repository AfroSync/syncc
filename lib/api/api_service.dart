import 'auth_api.dart';
import 'tracks_api.dart';

/// Main API service that provides access to all API services
class ApiService {
  static final ApiService _instance = ApiService._();

  static ApiService get instance => _instance;

  ApiService._();

  // API service instances
  late final AuthApiService _authApi;
  late final TracksApiService _tracksApi;

  /// Initialize all API services
  void initialize() {
    _authApi = AuthApiService.instance;
    _tracksApi = TracksApiService.instance;

    // Initialize all services
    _authApi.initialize();
    _tracksApi.initialize();
  }

  /// Get auth API service
  AuthApiService get auth => _authApi;

  /// Get tracks API service
  TracksApiService get tracks => _tracksApi;

  /// Dispose all API services
  void dispose() {
    _authApi.dispose();
    _tracksApi.dispose();
  }
}
