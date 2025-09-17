import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:syncc/controller/audio/audio_state.dart';
import 'package:syncc/model/track_model.dart';

/// Audio service to handle track playback
class AudioService {
  static final AudioService _instance = AudioService._();

  static AudioService get instance => _instance;

  AudioService._();

  final AudioPlayer _audioPlayer = AudioPlayer();
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<PlayerState>? _playerStateSubscription;

  /// Initialize the audio service
  Future<void> initialize() async {
    // Listen to position changes
    _positionSubscription = _audioPlayer.onPositionChanged.listen((position) {
      AudioStateManager.instance.updatePosition(position);
    });

    // Listen to duration changes
    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      AudioStateManager.instance.updateDuration(duration);
    });

    // Listen to player state changes
    _playerStateSubscription = _audioPlayer.onPlayerStateChanged.listen((
      state,
    ) {
      final audioState = AudioStateManager.instance.value;
      if (audioState.hasTrack) {
        switch (state) {
          case PlayerState.playing:
            AudioStateManager.instance.value = audioState.copyWith(
              isPlaying: true,
            );
            break;
          case PlayerState.paused:
            AudioStateManager.instance.value = audioState.copyWith(
              isPlaying: false,
            );
            break;
          case PlayerState.stopped:
            AudioStateManager.instance.value = audioState.copyWith(
              isPlaying: false,
            );
            break;
          case PlayerState.completed:
            AudioStateManager.instance.resetTrack();
            break;
          default:
            break;
        }
      }
    });
  }

  /// Play a track
  Future<void> playTrack(TrackModel track) async {
    try {
      // Update state first
      AudioStateManager.instance.playTrack(track);

      // Play the audio
      await _audioPlayer.play(UrlSource(track.trackUrl));
    } catch (e) {
      if (kDebugMode) {
        print('Error playing track: $e');
      }
      // Reset state on error
      AudioStateManager.instance.stopTrack();
    }
  }

  /// Pause current track
  Future<void> pauseTrack() async {
    try {
      await _audioPlayer.pause();
      AudioStateManager.instance.pauseTrack();
    } catch (e) {
      if (kDebugMode) {
        print('Error pausing track: $e');
      }
    }
  }

  /// Resume current track
  Future<void> resumeTrack() async {
    try {
      await _audioPlayer.resume();
      AudioStateManager.instance.resumeTrack();
    } catch (e) {
      if (kDebugMode) {
        print('Error resuming track: $e');
      }
    }
  }

  /// Stop current track
  Future<void> stopTrack() async {
    try {
      await _audioPlayer.stop();
      AudioStateManager.instance.stopTrack();
    } catch (e) {
      if (kDebugMode) {
        print('Error stopping track: $e');
      }
    }
  }

  /// Toggle play/pause
  Future<void> togglePlayPause() async {
    final audioState = AudioStateManager.instance.value;
    if (!audioState.hasTrack) return;

    if (audioState.isPlaying) {
      await pauseTrack();
    } else {
      await resumeTrack();
    }
  }

  /// Seek to position
  Future<void> seekTo(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e) {
      if (kDebugMode) {
        print('Error seeking: $e');
      }
    }
  }

  /// Reset track
  Future<void> resetTrack() async {
    try {
      await seekTo(Duration());
      await pauseTrack();
    } catch (e) {
      if (kDebugMode) {
        print('Error resetting: $e');
      }
    }
  }

  /// Dispose resources
  void dispose() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _audioPlayer.dispose();
  }
}
