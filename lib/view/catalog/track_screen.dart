import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:afrosync/model/track_model.dart';

import '../../controller/audio/audio_state.dart';
import '../../controller/audio/audio_service.dart';
import '../../core/color.dart';
import '../track/track_details_buttons.dart';
import '../track/track_metadata_list_view.dart';

class TrackScreen extends StatefulWidget {
  final TrackModel track;

  const TrackScreen(this.track, {super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AudioState>(
      valueListenable: AudioStateManager.instance,
      builder: (context, audioState, child) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),

                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 100,
                      maxHeight: 240,
                      minHeight: 100,
                      maxWidth: 240,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.track.coverArtUrl,
                      fit: BoxFit.cover,
                      errorWidget: (context, stuff, object) => SizedBox(),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  widget.track.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: ModernColors.text,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                      (widget.track.artistName).toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ModernColors.text,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "•",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ModernColors.text,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      _formatDuration(widget.track.duration).toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ModernColors.text,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "•",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ModernColors.text,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.track.releaseDate.year.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ModernColors.text,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // Play/Pause Button
                ValueListenableBuilder<AudioState>(
                  valueListenable: AudioStateManager.instance,
                  builder: (context, audioState, child) {
                    final isCurrentTrack =
                        audioState.trackId == widget.track.id;
                    final isPlaying = isCurrentTrack && audioState.isPlaying;

                    return GestureDetector(
                      onTap: () {
                        if (isCurrentTrack) {
                          // If this is the current track, toggle play/pause
                          AudioStateManager.instance.togglePlayPause();
                        } else {
                          // If this is a different track, play it
                          AudioStateManager.instance.playTrack(widget.track);
                        }
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ModernColors.primary,
                          boxShadow: [
                            BoxShadow(
                              color: ModernColors.primary.withValues(
                                alpha: 0.3,
                              ),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 40,
                          color: ModernColors.white,
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 24),

                TrackSeekerWidget(widget.track),
                TrackDetailsButtons(widget.track),
                SizedBox(height: 24),

                TrackMetadataListView(widget.track),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TrackSeekerWidget extends StatefulWidget {
  final TrackModel track;

  const TrackSeekerWidget(this.track, {super.key});

  @override
  State<TrackSeekerWidget> createState() => _TrackSeekerWidgetState();
}

class _TrackSeekerWidgetState extends State<TrackSeekerWidget> {
  bool _isDragging = false;
  double _dragValue = 0.0;

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AudioState>(
      valueListenable: AudioStateManager.instance,
      builder: (context, audioState, child) {
        final isCurrentTrack = audioState.trackId == widget.track.id;
        final position = audioState.position;
        final duration = audioState.duration;

        // Show position only if it's not zero or if we're dragging
        final shouldShowPosition = position != Duration.zero || _isDragging;

        // Calculate progress (0.0 to 1.0)
        double progress = 0.0;
        if (duration.inMilliseconds > 0) {
          if (_isDragging) {
            progress = _dragValue;
          } else {
            progress = position.inMilliseconds / duration.inMilliseconds;
          }
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              // Progress bar
              GestureDetector(
                onPanStart: (details) {
                  if (isCurrentTrack && duration.inMilliseconds > 0) {
                    setState(() {
                      _isDragging = true;
                    });
                  }
                },
                onPanUpdate: (details) {
                  if (isCurrentTrack && duration.inMilliseconds > 0) {
                    final RenderBox renderBox =
                        context.findRenderObject() as RenderBox;
                    final localPosition = renderBox.globalToLocal(
                      details.globalPosition,
                    );
                    final width = renderBox.size.width;
                    final newValue = (localPosition.dx / width).clamp(0.0, 1.0);

                    setState(() {
                      _dragValue = newValue;
                    });
                  }
                },
                onPanEnd: (details) {
                  if (isCurrentTrack && duration.inMilliseconds > 0) {
                    final newPosition = Duration(
                      milliseconds: (_dragValue * duration.inMilliseconds)
                          .round(),
                    );
                    AudioService.instance.seekTo(newPosition);

                    setState(() {
                      _isDragging = false;
                    });
                  }
                },
                child: Container(
                  height: 4.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: ModernColors.textSecondary.withValues(alpha: 0.3),
                  ),
                  child: Stack(
                    children: [
                      // Background
                      Container(
                        width: double.infinity,
                        height: 4.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: ModernColors.textSecondary.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                      // Progress
                      Container(
                        width: MediaQuery.of(context).size.width * progress,
                        height: 4.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: isCurrentTrack
                              ? ModernColors.primary
                              : ModernColors.textSecondary.withValues(
                                  alpha: 0.5,
                                ),
                        ),
                      ),
                      // Thumb
                      if (isCurrentTrack)
                        Positioned(
                          left:
                              (MediaQuery.of(context).size.width * progress) -
                              8.0,
                          top: -6.0,
                          child: Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ModernColors.primary,
                              border: Border.all(
                                color: ModernColors.background,
                                width: 2.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  blurRadius: 4.0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // Time display
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: shouldShowPosition
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _isDragging
                                ? _formatDuration(
                                    Duration(
                                      milliseconds:
                                          (_dragValue * duration.inMilliseconds)
                                              .round(),
                                    ),
                                  )
                                : _formatDuration(position),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: ModernColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _formatDuration(duration),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: ModernColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }
}
