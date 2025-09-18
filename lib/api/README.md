# API Services

This folder contains the modular API services for the Syncc application.

## Structure

- `base.dart` - Base API service class with common functionality
- `auth_api.dart` - Authentication API service
- `tracks_api.dart` - Tracks API service
- `api_service.dart` - Main API service that combines all services

## Usage

### Initialize API Services

```dart
import 'package:afrosync/core/api/api_service.dart';

void main() {
  // Initialize all API services
  ApiService.instance.initialize();
}
```

### Authentication API

```dart
import 'package:afrosync/core/api/api_service.dart';

// Sign up
final response = await ApiService.instance.auth.signUp(
  role: 'artist',
  firstName: 'John',
  lastName: 'Doe',
  countryCode: 'NG',
  email: 'john@example.com',
  password: 'password123',
  stageName: 'Johnny Beats',
);

// Sign in
final loginResponse = await ApiService.instance.auth.signIn(
  email: 'john@example.com',
  password: 'password123',
);

// Get profile
final profileResponse = await ApiService.instance.auth.getProfile(
  token: 'your_jwt_token',
);
```

### Tracks API

```dart
import 'package:afrosync/core/api/api_service.dart';

// Get tracks for homepage
final tracksResponse = await ApiService.instance.tracks.getTracksHomepage(
  page: 1,
  limit: 20,
  genre: 'Afrobeats',
  mood: 'Upbeat',
);

if (tracksResponse.success) {
  final tracks = tracksResponse.data?.tracks ?? [];
  print('Retrieved ${tracks.length} tracks');
}
```

## Adding New API Services

1. Create a new file in this folder (e.g., `users_api.dart`)
2. Extend `BaseApiService`
3. Add the service to `ApiService` class
4. Initialize it in the `initialize()` method

Example:

```dart
// users_api.dart
import 'base.dart';

class UsersApiService extends BaseApiService {
  static final UsersApiService _instance = UsersApiService._();
  static UsersApiService get instance => _instance;
  
  UsersApiService._();

  Future<ApiResponse<List<User>>> getUsers() async {
    return request<List<User>>(
      endpoint: '/users',
      method: 'GET',
      fromJson: (json) => (json['users'] as List)
          .map((user) => User.fromJson(user))
          .toList(),
    );
  }
}
```

Then add to `api_service.dart`:

```dart
late final UsersApiService _usersApi;

void initialize() {
  // ... existing code ...
  _usersApi = UsersApiService.instance;
  _usersApi.initialize();
}

UsersApiService get users => _usersApi;
```
