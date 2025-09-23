import 'dart:io';
import 'package:afrosync/model/tracks_response.dart';
import 'package:afrosync/model/track_model.dart';
import 'base.dart';

/// Tracks API endpoints
class TracksEndpoints {
  static const String homepage = '/tracks/homepage';
  static const String create = '/track';
  static const String upload = '/upload';
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

  /// Create a new track
  Future<ApiResponse<TrackModel>> createTrack({
    required String title,
    required Map<String, dynamic> metadata,
    required String releaseDate,
    required int duration,
    required String description,
    required String trackUrl,
    required String coverArtUrl,
    // required Map<String, dynamic> license,
    String? trackPublicId,
    String? coverArtPublicId,
  }) async {
    final requestBody = {
      'title': title,
      'metadata_': metadata,
      'release_date': releaseDate,
      'duration': duration,
      'description': description,
      'track_url': trackUrl,
      'cover_art_url': coverArtUrl,
      // 'license': license,
      if (trackPublicId != null) 'track_public_id': trackPublicId,
      if (coverArtPublicId != null) 'cover_art_public_id': coverArtPublicId,
    };

    return request<TrackModel>(
      endpoint: TracksEndpoints.create,
      method: 'POST',
      body: requestBody,
      fromJson: (json) => TrackModel.fromJson(json),
    );
  }

  /// Upload audio file
  Future<ApiResponse<Map<String, dynamic>>> uploadAudioFile(File file) async {
    return uploadFile<Map<String, dynamic>>(
      endpoint: TracksEndpoints.upload,
      file: file,
      fieldName: 'file',
      queryParams: {'type': 'audio'},
      fromJson: (json) => json,
    );
  }

  /// Upload image file (cover art)
  Future<ApiResponse<Map<String, dynamic>>> uploadImageFile(File file) async {
    return uploadFile<Map<String, dynamic>>(
      endpoint: TracksEndpoints.upload,
      file: file,
      fieldName: 'file',
      queryParams: {'type': 'image'},
      fromJson: (json) => json,
    );
  }
}
