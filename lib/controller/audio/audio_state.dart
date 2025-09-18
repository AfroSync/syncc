import 'package:flutter/foundation.dart';
import 'package:afrosync/model/track_model.dart';

/// Simple audio state management for track playback
class AudioState {
  final int? trackId;
  final String? trackTitle;
  final String? trackUrl;
  final String? coverArtUrl;
  final TrackModel? track;
  final bool isPlaying;
  final Duration position;
  final Duration duration;

  const AudioState({
    this.trackId,
    this.trackTitle,
    this.trackUrl,
    this.coverArtUrl,
    this.track,
    this.isPlaying = false,
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });

  AudioState copyWith({
    int? trackId,
    String? trackTitle,
    String? trackUrl,
    String? coverArtUrl,
    TrackModel? track,
    bool? isPlaying,
    Duration? position,
    Duration? duration,
  }) {
    return AudioState(
      trackId: trackId ?? this.trackId,
      trackTitle: trackTitle ?? this.trackTitle,
      trackUrl: trackUrl ?? this.trackUrl,
      coverArtUrl: coverArtUrl ?? this.coverArtUrl,
      track: track ?? this.track,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }

  bool get hasTrack => trackId != null;

  bool get isPaused => hasTrack && !isPlaying;

  bool get isStopped => !hasTrack || (!isPlaying && position == Duration.zero);
}

/// Global audio state manager
class AudioStateManager extends ValueNotifier<AudioState> {
  AudioStateManager._() : super(const AudioState());

  static final AudioStateManager _instance = AudioStateManager._();

  static AudioStateManager get instance => _instance;

  /// Play a track
  void playTrack(TrackModel track) {
    value = value.copyWith(
      trackId: track.id,
      trackTitle: track.title,
      trackUrl: track.trackUrl,
      coverArtUrl: track.coverArtUrl,
      track: track,
      isPlaying: true,
      position: Duration.zero,
      duration: Duration(seconds: track.duration),
    );
  }

  /// Pause current track
  void pauseTrack() {
    if (value.hasTrack) {
      value = value.copyWith(isPlaying: false);
    }
  }

  /// Pause current track
  void resetTrack() {
    if (value.hasTrack) {
      value = value.copyWith(position: Duration());
    }
  }

  /// Resume current track
  void resumeTrack() {
    if (value.hasTrack) {
      value = value.copyWith(isPlaying: true);
    }
  }

  /// Stop current track
  void stopTrack() {
    value = const AudioState();
  }

  /// Update playback position
  void updatePosition(Duration position) {
    if (value.hasTrack) {
      value = value.copyWith(position: position);
    }
  }

  /// Update track duration
  void updateDuration(Duration duration) {
    if (value.hasTrack) {
      value = value.copyWith(duration: duration);
    }
  }

  /// Toggle play/pause
  void togglePlayPause() {
    if (!value.hasTrack) return;

    if (value.isPlaying) {
      pauseTrack();
    } else {
      resumeTrack();
    }
  }
}
