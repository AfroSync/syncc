import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncc/core/color.dart';
import 'package:syncc/model/track_model.dart';
import 'package:syncc/view/catalog/track_screen.dart';
import 'package:syncc/controller/audio/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../controller/audio/audio_state.dart';

class TrackTile extends StatefulWidget {
  final TrackModel track;
  final bool addHorizontalPadding;

  const TrackTile(this.track, {super.key, this.addHorizontalPadding = true});

  @override
  State<TrackTile> createState() => _TrackTileState();
}

class _TrackTileState extends State<TrackTile> {
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
        final isCurrentTrack = audioState.trackId == widget.track.id;
        final isPlaying = isCurrentTrack && audioState.isPlaying;

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrackScreen(widget.track),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: widget.addHorizontalPadding ? 16.0 : 0,
            ),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ModernColors.textSecondary,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    alignment: AlignmentGeometry.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: CachedNetworkImage(
                          imageUrl: widget.track.coverArtUrl,
                          fit: BoxFit.cover,
                          errorWidget: (context, stuff, object) => SizedBox(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.all(12),
                        child: IconButton.filled(
                          onPressed: () {
                            if (isCurrentTrack) {
                              AudioService.instance.togglePlayPause();
                            } else {
                              AudioService.instance.playTrack(widget.track);
                            }
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.8,
                            ),
                          ),
                          icon: Icon(
                            isCurrentTrack && isPlaying
                                ? CupertinoIcons.pause_fill
                                : CupertinoIcons.play_fill,
                            color: Colors.black87,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.track.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ModernColors.text,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.track.metadata.genre,
                        style: TextStyle(
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
                Text(
                  _formatDuration(widget.track.duration),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ModernColors.text,
                  ),
                ),
                SizedBox(width: 12),

                IconButton(
                  onPressed: () {},

                  icon: Icon(CupertinoIcons.heart, size: 24),
                ),

                IconButton(
                  onPressed: () {},

                  icon: Icon(Icons.more_horiz, size: 24),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
