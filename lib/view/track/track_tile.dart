import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afrosync/core/color.dart';
import 'package:afrosync/model/track_model.dart';
import 'package:afrosync/view/catalog/track_screen.dart';
import 'package:afrosync/controller/audio/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../controller/audio/audio_state.dart';

class TrackTile extends StatefulWidget {
  final TrackModel track;
  final bool addHorizontalPadding;
  final bool showArtist;

  const TrackTile(
    this.track, {
    super.key,
    this.addHorizontalPadding = true,
    this.showArtist = true,
  });

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
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ModernColors.textSecondary,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    imageUrl: widget.track.coverArtUrl,
                    fit: BoxFit.cover,
                    errorWidget: (context, stuff, object) => SizedBox(),
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
                      if (widget.showArtist)
                        Text(
                          widget.track.artistName,
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
                  onPressed: () {
                    if (isCurrentTrack) {
                      AudioService.instance.togglePlayPause();
                    } else {
                      AudioService.instance.playTrack(widget.track);
                    }
                  },

                  icon: Icon(
                    isCurrentTrack && isPlaying
                        ? CupertinoIcons.pause_fill
                        : CupertinoIcons.play_fill,
                    color: Colors.black87,
                    size: 18,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(120),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Icon(Icons.more_vert, size: 24),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
