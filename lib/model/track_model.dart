import 'track_metadata.dart';
import 'license_model.dart';
import 'basic_license.dart';

class TrackModel {
  int id;
  String title;
  String artistName;
  TrackMetadata metadata;
  DateTime releaseDate;
  int duration; // Duration in seconds
  String description;
  String trackUrl;
  String coverArtUrl;
  LicenseModel license;

  TrackModel({
    this.id = 1,
    this.title = "Sample Track",
    this.artistName = "Unknown Artist",
    TrackMetadata? metadata,
    DateTime? releaseDate,
    this.duration = 135, // 2 minutes in seconds
    this.description = "Sample track description",
    this.trackUrl = "https://www.soundjay.com/misc/sounds/bell-ringing-05.wav",
    this.coverArtUrl = "https://via.placeholder.com/300x300",
    LicenseModel? license,
  }) : metadata = metadata ?? TrackMetadata(),
       releaseDate = releaseDate ?? DateTime.now(),
       license = license ?? const LicenseModel();

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist_name': artistName,
      'metadata': metadata.toJson(),
      'release_date': releaseDate.toIso8601String().split('T')[0],
      // Format as YYYY-MM-DD
      'duration': duration,
      'description': description,
      'track_url': trackUrl,
      'cover_art_url': coverArtUrl,
      'license': license.toJson(),
    };
  }

  // fromJson factory constructor
  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      artistName: json['artist_name'] as String? ?? "Unknown Artist",
      metadata: json['metadata_'] != null
          ? TrackMetadata.fromJson(json['metadata_'] as Map<String, dynamic>)
          : TrackMetadata(),
      releaseDate: json['release_date'] != null
          ? DateTime.parse(json['release_date'] as String)
          : DateTime.now(),
      duration: json['duration'] as int? ?? 180,
      description: json['description'] as String? ?? "",
      trackUrl: json['track_url'] as String? ?? "",
      coverArtUrl: json['cover_art_url'] as String? ?? "",
      license: json['license'] != null
          ? LicenseModel.fromJson(json['license'] as Map<String, dynamic>)
          : const LicenseModel(),
    );
  }

  // Copy with method for updates
  TrackModel copyWith({
    int? id,
    String? title,
    String? artistName,
    TrackMetadata? metadata,
    DateTime? releaseDate,
    int? duration,
    String? description,
    String? trackUrl,
    String? coverArtUrl,
    LicenseModel? license,
  }) {
    return TrackModel(
      id: id ?? this.id,
      title: title ?? this.title,
      artistName: artistName ?? this.artistName,
      metadata: metadata ?? this.metadata,
      releaseDate: releaseDate ?? this.releaseDate,
      duration: duration ?? this.duration,
      description: description ?? this.description,
      trackUrl: trackUrl ?? this.trackUrl,
      coverArtUrl: coverArtUrl ?? this.coverArtUrl,
      license: license ?? this.license,
    );
  }

  @override
  String toString() {
    return 'TrackModel(id: $id, title: $title, artistName: $artistName, genre: ${metadata.genre}, duration: ${duration}s)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TrackModel &&
        other.id == id &&
        other.title == title &&
        other.artistName == artistName &&
        other.metadata == metadata &&
        other.releaseDate == releaseDate &&
        other.duration == duration &&
        other.description == description &&
        other.trackUrl == trackUrl &&
        other.coverArtUrl == coverArtUrl &&
        other.license == license;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        artistName.hashCode ^
        metadata.hashCode ^
        releaseDate.hashCode ^
        duration.hashCode ^
        description.hashCode ^
        trackUrl.hashCode ^
        coverArtUrl.hashCode ^
        license.hashCode;
  }
}
