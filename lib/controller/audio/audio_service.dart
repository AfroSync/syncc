import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:afrosync/controller/audio/audio_state.dart';
import 'package:afrosync/model/track_model.dart';

/// Audio service to handle track playback
///
/// This service is registered as a singleton in the service locator
/// to maintain state and connections across the app lifecycle.
class AudioService {
  static final AudioService _instance = AudioService._();

  static AudioService get instance => _instance;

  /// Get the instance from service locator (preferred method)
  static AudioService get fromServiceLocator => GetIt.instance<AudioService>();

  AudioService._();

  final AudioPlayer _audioPlayer = AudioPlayer();
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<PlayerState>? _playerStateSubscription;

  /// Initialize the audio service
  Future<void> initialize() async {
    // Get the audio state manager from service locator
    final audioStateManager = AudioStateManager.fromServiceLocator;

    // Listen to position changes
    _positionSubscription = _audioPlayer.onPositionChanged.listen((position) {
      audioStateManager.updatePosition(position);
    });

    // Listen to duration changes
    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      audioStateManager.updateDuration(duration);
    });

    // Listen to player state changes
    _playerStateSubscription = _audioPlayer.onPlayerStateChanged.listen((
      state,
    ) {
      final audioState = audioStateManager.value;
      if (audioState.hasTrack) {
        switch (state) {
          case PlayerState.playing:
            audioStateManager.value = audioState.copyWith(isPlaying: true);
            break;
          case PlayerState.paused:
            audioStateManager.value = audioState.copyWith(isPlaying: false);
            break;
          case PlayerState.stopped:
            audioStateManager.value = audioState.copyWith(isPlaying: false);
            break;
          case PlayerState.completed:
            audioStateManager.resetTrack();
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
      AudioStateManager.fromServiceLocator.playTrack(track);

      // Play the audio
      await _audioPlayer.play(UrlSource(track.trackUrl));
    } catch (e) {
      if (kDebugMode) {
        print('Error playing track: $e');
      }
      // Reset state on error
      AudioStateManager.fromServiceLocator.stopTrack();
    }
  }

  /// Pause current track
  Future<void> pauseTrack() async {
    try {
      await _audioPlayer.pause();
      AudioStateManager.fromServiceLocator.pauseTrack();
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
      AudioStateManager.fromServiceLocator.resumeTrack();
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
      AudioStateManager.fromServiceLocator.stopTrack();
    } catch (e) {
      if (kDebugMode) {
        print('Error stopping track: $e');
      }
    }
  }

  /// Toggle play/pause
  Future<void> togglePlayPause() async {
    final audioState = AudioStateManager.fromServiceLocator.value;
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
