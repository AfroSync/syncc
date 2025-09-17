import 'base.dart';

/// Auth API endpoints
class AuthEndpoints {
  static const String signup = '/auth/signup';
  static const String login = '/auth/login';
  static const String verify = '/auth/verify-kyc';
  static const String profile = '/auth/profile';
}

/// Authentication API service
class AuthApiService extends BaseApiService {
  static final AuthApiService _instance = AuthApiService._();
  static AuthApiService get instance => _instance;

  AuthApiService._();

  /// Sign up user
  Future<ApiResponse<Map<String, dynamic>>> signUp({
    required String role,
    required String firstName,
    required String lastName,
    required String countryCode,
    required String email,
    required String password,
    String? stageName,
  }) async {
    final body = {
      'role': role,
      'first_name': firstName,
      'last_name': lastName,
      'country_code': countryCode,
      'email': email,
      'password': password,
      if (stageName != null) 'stage_name': stageName,
    };

    return request<Map<String, dynamic>>(
      endpoint: AuthEndpoints.signup,
      method: 'POST',
      body: body,
    );
  }

  /// Sign in user
  Future<ApiResponse<Map<String, dynamic>>> signIn({
    required String email,
    required String password,
  }) async {
    final body = {'email': email, 'password': password};

    return request<Map<String, dynamic>>(
      endpoint: AuthEndpoints.login,
      method: 'POST',
      body: body,
    );
  }

  /// Verify user
  Future<ApiResponse<Map<String, dynamic>>> verifyUser({
    required String email,
    required String code,
  }) async {
    final body = {'email': email, 'code': code};

    return request<Map<String, dynamic>>(
      endpoint: AuthEndpoints.verify,
      method: 'POST',
      body: body,
    );
  }

  /// Get user profile
  Future<ApiResponse<Map<String, dynamic>>> getProfile({
    required String token,
  }) async {
    return request<Map<String, dynamic>>(
      endpoint: AuthEndpoints.profile,
      method: 'GET',
      headers: {'Authorization': 'Bearer $token'},
    );
  }
}
