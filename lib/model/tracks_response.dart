import 'track_model.dart';

/// Response model for tracks API endpoints
class TracksResponse {
  final List<TrackModel> tracks;
  final int totalCount;
  final int currentPage;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;

  TracksResponse({
    this.tracks = const [],
    this.totalCount = 0,
    this.currentPage = 1,
    this.totalPages = 1,
    this.hasNextPage = false,
    this.hasPreviousPage = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'tracks': tracks.map((track) => track.toJson()).toList(),
      'total_count': totalCount,
      'current_page': currentPage,
      'total_pages': totalPages,
      'has_next_page': hasNextPage,
      'has_previous_page': hasPreviousPage,
    };
  }

  factory TracksResponse.fromJson(Map<String, dynamic> json) {
    return TracksResponse(
      tracks: (json['tracks'] as List<dynamic>?)
              ?.map((trackJson) => TrackModel.fromJson(trackJson as Map<String, dynamic>))
              .toList() ??
          [],
      totalCount: json['total_count'] as int? ?? 0,
      currentPage: json['current_page'] as int? ?? 1,
      totalPages: json['total_pages'] as int? ?? 1,
      hasNextPage: json['has_next_page'] as bool? ?? false,
      hasPreviousPage: json['has_previous_page'] as bool? ?? false,
    );
  }

  TracksResponse copyWith({
    List<TrackModel>? tracks,
    int? totalCount,
    int? currentPage,
    int? totalPages,
    bool? hasNextPage,
    bool? hasPreviousPage,
  }) {
    return TracksResponse(
      tracks: tracks ?? this.tracks,
      totalCount: totalCount ?? this.totalCount,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
    );
  }

  @override
  String toString() {
    return 'TracksResponse(tracks: ${tracks.length}, totalCount: $totalCount, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TracksResponse &&
        other.tracks == tracks &&
        other.totalCount == totalCount &&
        other.currentPage == currentPage &&
        other.totalPages == totalPages &&
        other.hasNextPage == hasNextPage &&
        other.hasPreviousPage == hasPreviousPage;
  }

  @override
  int get hashCode {
    return tracks.hashCode ^
        totalCount.hashCode ^
        currentPage.hashCode ^
        totalPages.hashCode ^
        hasNextPage.hashCode ^
        hasPreviousPage.hashCode;
  }
}
