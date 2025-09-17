class TrackMetadata {
  String genre;
  String mood;
  List<String> instrumentation;
  List<String> sceneSuitability;
  String build;
  String vocalType;
  String tempo;
  bool instrumentalOnly;
  bool lyricalOnly;

  TrackMetadata({
    this.genre = 'Unknown',
    this.mood = 'Unknown',
    this.instrumentation = const [],
    this.sceneSuitability = const [],
    this.build = 'Unknown',
    this.vocalType = 'Unknown',
    this.tempo = 'Unknown',
    this.instrumentalOnly = false,
    this.lyricalOnly = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'genre': genre,
      'mood': mood,
      'instrumentation': instrumentation,
      'scene_suitability': sceneSuitability,
      'build': build,
      'vocal_type': vocalType,
      'tempo': tempo,
      'instrumental_only': instrumentalOnly,
      'lyrical_only': lyricalOnly,
    };
  }

  factory TrackMetadata.fromJson(Map<String, dynamic> json) {
    return TrackMetadata(
      genre: json['genre'] as String? ?? 'Unknown',
      mood: json['mood'] as String? ?? 'Unknown',
      instrumentation:
          (json['instrumentation'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      sceneSuitability:
          (json['scene_suitability'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      build: json['build'] as String? ?? 'Unknown',
      vocalType: json['vocal_type'] as String? ?? 'Unknown',
      tempo: json['tempo'] as String? ?? 'Unknown',
      instrumentalOnly: json['instrumental_only'] as bool? ?? false,
      lyricalOnly: json['lyrical_only'] as bool? ?? false,
    );
  }

  TrackMetadata copyWith({
    String? genre,
    String? mood,
    List<String>? instrumentation,
    List<String>? sceneSuitability,
    String? build,
    String? vocalType,
    String? tempo,
    bool? instrumentalOnly,
    bool? lyricalOnly,
  }) {
    return TrackMetadata(
      genre: genre ?? this.genre,
      mood: mood ?? this.mood,
      instrumentation: instrumentation ?? this.instrumentation,
      sceneSuitability: sceneSuitability ?? this.sceneSuitability,
      build: build ?? this.build,
      vocalType: vocalType ?? this.vocalType,
      tempo: tempo ?? this.tempo,
      instrumentalOnly: instrumentalOnly ?? this.instrumentalOnly,
      lyricalOnly: lyricalOnly ?? this.lyricalOnly,
    );
  }

  @override
  String toString() {
    return 'TrackMetadata(genre: $genre, mood: $mood, build: $build, vocalType: $vocalType, tempo: $tempo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TrackMetadata &&
        other.genre == genre &&
        other.mood == mood &&
        other.instrumentation == instrumentation &&
        other.sceneSuitability == sceneSuitability &&
        other.build == build &&
        other.vocalType == vocalType &&
        other.tempo == tempo &&
        other.instrumentalOnly == instrumentalOnly &&
        other.lyricalOnly == lyricalOnly;
  }

  @override
  int get hashCode {
    return genre.hashCode ^
        mood.hashCode ^
        instrumentation.hashCode ^
        sceneSuitability.hashCode ^
        build.hashCode ^
        vocalType.hashCode ^
        tempo.hashCode ^
        instrumentalOnly.hashCode ^
        lyricalOnly.hashCode;
  }
}
