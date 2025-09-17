import '../enums/music_genre.dart';
import 'user_model.dart';

class ArtistModel extends UserModel {
  String stageName;
  List<MusicGenre> genres;

  ArtistModel({
    super.firstName = '',
    super.lastName = '',
    super.countryCode = 'NG',
    super.email = '',
    super.password = '',
    this.stageName = '',
    this.genres = const [],
  }) : super(role: 'artist');

  // toJson method
  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'stage_name': stageName,
      'genres': genres.map((genre) => genre.name).toList(),
    };
  }

  // fromJson factory constructor
  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      countryCode: json['country_code'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      stageName: json['stage_name'] as String? ?? '',
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map(
                (genre) => MusicGenre.values.firstWhere(
                  (e) => e.name == genre,
                  orElse: () => MusicGenre.other,
                ),
              )
              .toList() ??
          [],
    );
  }

  // Copy with method for updates
  @override
  ArtistModel copyWith({
    String? role,
    String? firstName,
    String? lastName,
    String? countryCode,
    String? email,
    String? password,
    String? stageName,
    List<MusicGenre>? genres,
  }) {
    return ArtistModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      countryCode: countryCode ?? this.countryCode,
      email: email ?? this.email,
      password: password ?? this.password,
      stageName: stageName ?? this.stageName,
      genres: genres ?? this.genres,
    );
  }

  @override
  String toString() {
    return 'ArtistModel(stageName: $stageName, fullName: $fullName, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ArtistModel &&
        super == other &&
        other.stageName == stageName &&
        other.genres.length == genres.length &&
        other.genres.every((genre) => genres.contains(genre));
  }

  @override
  int get hashCode {
    return super.hashCode ^ stageName.hashCode ^ genres.hashCode;
  }
}
