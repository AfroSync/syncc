import 'package:flutter/foundation.dart';
import 'package:syncc/model/user/user_model.dart';
import 'package:syncc/model/user/artist_model.dart';
import 'package:syncc/model/user/producer_model.dart';
import 'package:syncc/model/enums/music_genre.dart';

/// Auth state for managing user authentication
class AuthState {
  final UserModel? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  String toString() {
    return 'AuthState(user: $user, isLoading: $isLoading, error: $error, isAuthenticated: $isAuthenticated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthState &&
        other.user == user &&
        other.isLoading == isLoading &&
        other.error == error &&
        other.isAuthenticated == isAuthenticated;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        isLoading.hashCode ^
        error.hashCode ^
        isAuthenticated.hashCode;
  }
}

/// Global auth controller using ValueNotifier for state management
class AuthController extends ValueNotifier<AuthState> {
  AuthController._() : super(const AuthState());

  static final AuthController _instance = AuthController._();
  static AuthController get instance => _instance;

  // Getters for easy access to current state
  UserModel? get currentUser => value.user;
  bool get isAuthenticated => value.isAuthenticated;
  bool get isLoading => value.isLoading;
  String? get error => value.error;

  /// Set loading state
  void setLoading(bool loading) {
    value = value.copyWith(isLoading: loading, error: null);
  }

  /// Set error state
  void setError(String error) {
    value = value.copyWith(isLoading: false, error: error);
  }

  /// Clear error state
  void clearError() {
    value = value.copyWith(error: null);
  }

  /// Set authenticated user
  void setUser(UserModel user) {
    value = value.copyWith(
      user: user,
      isAuthenticated: true,
      isLoading: false,
      error: null,
    );
  }

  /// Logout user
  void logout() {
    value = const AuthState();
  }

  /// Sign up user (to be implemented)
  Future<void> signUp({
    required String role,
    required String firstName,
    required String lastName,
    required String countryCode,
    required String email,
    required String password,
    String? stageName,
    List<String>? genres,
    String? organization,
  }) async {
    setLoading(true);

    try {
      // TODO: Implement API call to backend
      // This is where the actual signup logic will go

      // For now, create a mock user based on role
      UserModel user;
      if (role == 'artist') {
        user = ArtistModel(
          firstName: firstName,
          lastName: lastName,
          countryCode: countryCode,
          email: email,
          password: password,
          stageName: stageName ?? '',
          genres:
              genres
                  ?.map(
                    (g) => MusicGenre.values.firstWhere(
                      (e) => e.name == g,
                      orElse: () => MusicGenre.other,
                    ),
                  )
                  .toList() ??
              [],
        );
      } else if (role == 'filmmaker') {
        user = ProducerModel(
          firstName: firstName,
          lastName: lastName,
          countryCode: countryCode,
          email: email,
          password: password,
          organization: organization ?? '',
        );
      } else {
        user = UserModel(
          role: role,
          firstName: firstName,
          lastName: lastName,
          countryCode: countryCode,
          email: email,
          password: password,
        );
      }

      setUser(user);
    } catch (e) {
      setError(e.toString());
    }
  }

  /// Sign in user (to be implemented)
  Future<void> signIn({required String email, required String password}) async {
    setLoading(true);

    try {
      // TODO: Implement API call to backend
      // This is where the actual signin logic will go

      setError('Sign in not implemented yet');
    } catch (e) {
      setError(e.toString());
    }
  }

  /// Verify user (to be implemented)
  Future<void> verifyUser({required String email, required String code}) async {
    setLoading(true);

    try {
      // TODO: Implement API call to backend
      // This is where the actual verification logic will go

      setError('Verification not implemented yet');
    } catch (e) {
      setError(e.toString());
    }
  }
}
