import 'package:flutter/material.dart';

import '../../controller/audio/audio_state.dart';
import '../../core/color.dart';

/// Progress bar widget for the audio player
class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AudioState>(
      valueListenable: AudioStateManager.instance,
      builder: (context, audioState, child) {
        if (!audioState.hasTrack || audioState.duration == Duration.zero) {
          return const SizedBox.shrink();
        }

        final progress =
            audioState.position.inMilliseconds /
            audioState.duration.inMilliseconds;

        return Container(
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: ModernColors.textSecondary.withValues(alpha: 0.2),
            valueColor: AlwaysStoppedAnimation<Color>(ModernColors.primary),
          ),
        );
      },
    );
  }
}
