import 'package:syncc/model/tracks_response.dart';
import 'base.dart';

/// Tracks API endpoints
class TracksEndpoints {
  static const String homepage = '/tracks/homepage';
}

/// Tracks API service
class TracksApiService extends BaseApiService {
  static final TracksApiService _instance = TracksApiService._();

  static TracksApiService get instance => _instance;

  TracksApiService._();

  /// Get tracks for homepage
  Future<ApiResponse<TracksResponse>> getTracksHomepage({
    int page = 1,
    int limit = 20,
    String? genre,
    String? mood,
  }) async {
    final queryParams = <String, dynamic>{'page': page, 'limit': limit};

    if (genre != null && genre.isNotEmpty) {
      queryParams['genre'] = genre;
    }

    if (mood != null && mood.isNotEmpty) {
      queryParams['mood'] = mood;
    }

    return request<TracksResponse>(
      endpoint: TracksEndpoints.homepage,
      method: 'GET',
      queryParams: queryParams,
      fromJson: (json) => TracksResponse.fromJson(json),
    );
  }
}
