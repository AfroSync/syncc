import 'track_metadata.dart';

class TrackModel {
  int id;
  String title;
  TrackMetadata metadata;
  DateTime releaseDate;
  int duration; // Duration in seconds
  String description;
  String trackUrl;
  String coverArtUrl;

  TrackModel({
    this.id = 01,
    this.title = "Sample Track",
    TrackMetadata? metadata,
    DateTime? releaseDate,
    this.duration = 180, // 3 minutes in seconds
    this.description = "Sample track description",
    this.trackUrl = "https://www.soundjay.com/misc/sounds/bell-ringing-05.wav",
    this.coverArtUrl = "https://via.placeholder.com/300x300",
  }) : metadata = metadata ?? TrackMetadata(),
       releaseDate = releaseDate ?? DateTime.now();

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'metadata': metadata.toJson(),
      'release_date': releaseDate.toIso8601String().split('T')[0],
      // Format as YYYY-MM-DD
      'duration': duration,
      'description': description,
      'track_url': trackUrl,
      'cover_art_url': coverArtUrl,
    };
  }

  // fromJson factory constructor
  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      metadata: json['metadata'] != null
          ? TrackMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : TrackMetadata(),
      releaseDate: json['release_date'] != null
          ? DateTime.parse(json['release_date'] as String)
          : DateTime.now(),
      duration: json['duration'] as int? ?? 180,
      description: json['description'] as String? ?? "",
      trackUrl: json['track_url'] as String? ?? "",
      coverArtUrl: json['cover_art_url'] as String? ?? "",
    );
  }

  // Copy with method for updates
  TrackModel copyWith({
    int? id,
    String? title,
    TrackMetadata? metadata,
    DateTime? releaseDate,
    int? duration,
    String? description,
    String? trackUrl,
    String? coverArtUrl,
  }) {
    return TrackModel(
      id: id ?? this.id,
      title: title ?? this.title,
      metadata: metadata ?? this.metadata,
      releaseDate: releaseDate ?? this.releaseDate,
      duration: duration ?? this.duration,
      description: description ?? this.description,
      trackUrl: trackUrl ?? this.trackUrl,
      coverArtUrl: coverArtUrl ?? this.coverArtUrl,
    );
  }

  @override
  String toString() {
    return 'TrackModel(id: $id, title: $title, genre: ${metadata.genre}, duration: ${duration}s)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TrackModel &&
        other.id == id &&
        other.title == title &&
        other.metadata == metadata &&
        other.releaseDate == releaseDate &&
        other.duration == duration &&
        other.description == description &&
        other.trackUrl == trackUrl &&
        other.coverArtUrl == coverArtUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        metadata.hashCode ^
        releaseDate.hashCode ^
        duration.hashCode ^
        description.hashCode ^
        trackUrl.hashCode ^
        coverArtUrl.hashCode;
  }
}
