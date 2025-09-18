import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afrosync/controller/audio/audio_state.dart';
import 'package:afrosync/controller/audio/audio_service.dart';
import 'package:afrosync/core/color.dart';
import 'package:afrosync/model/track_model.dart';

import '../catalog/track_screen.dart';

/// Simple audio player widget that shows when a track is playing
class AudioPlayerWidget extends StatelessWidget {
  const AudioPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AudioState>(
      valueListenable: AudioStateManager.instance,
      builder: (context, audioState, child) {
        if (!audioState.hasTrack) {
          return const SizedBox(width: double.infinity);
        }

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TrackScreen(audioState.track ?? TrackModel()),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(right: 12, left: 12, top: 4),
            margin: const EdgeInsets.symmetric(horizontal: 4),

            decoration: BoxDecoration(
              color: ModernColors.white.withOpacity(0.9),
              border: Border(
                top: BorderSide(
                  color: ModernColors.textSecondary.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              borderRadius: BorderRadiusGeometry.circular(12),

              boxShadow: [
                BoxShadow(
                  color: ModernColors.primary.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    // Track info
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: ModernColors.textSecondary,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: CachedNetworkImage(
                        imageUrl: audioState.coverArtUrl ?? "",
                        fit: BoxFit.cover,
                        errorWidget: (context, stuff, object) => SizedBox(),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            audioState.trackTitle ?? 'Unknown Track',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ModernColors.text,
                              height: 1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            audioState.track!.artistName,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ModernColors.textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => AudioService.instance.togglePlayPause(),
                      icon: Icon(
                        CupertinoIcons.heart,
                        size: 24,
                        color: ModernColors.primary,
                      ),
                    ),

                    // Play/Pause button
                    IconButton(
                      onPressed: () => AudioService.instance.togglePlayPause(),
                      icon: Icon(
                        audioState.isPlaying
                            ? Icons.pause_rounded
                            : CupertinoIcons.play_fill,
                        size: 24,
                        color: ModernColors.primary,
                      ),
                    ),

                    // // Stop button
                    // IconButton(
                    //   onPressed: () => AudioService.instance.stopTrack(),
                    //   icon: const Icon(
                    //     Icons.stop,
                    //     size: 24,
                    //     color: ModernColors.textSecondary,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 2),

                AudioPlayerSeeker(
                  audioState.position.inMilliseconds /
                      audioState.duration.inMilliseconds,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AudioPlayerSeeker extends StatelessWidget {
  final double position;

  const AudioPlayerSeeker(this.position, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              height: 4,
              width: constraints.maxWidth,
            ),
            Container(
              decoration: BoxDecoration(
                color: ModernColors.textSecondary.withOpacity(0.7),
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              height: 4,
              width: position * constraints.maxWidth,
            ),
          ],
        );
      },
    );
  }
}
