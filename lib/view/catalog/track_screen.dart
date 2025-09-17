import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncc/model/track_model.dart';
import 'package:syncc/view/widget/modern_profile_picker.dart';

import '../../controller/audio/audio_state.dart';
import '../../core/color.dart';

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
        final isCurrentTrack = audioState.trackId == widget.track.id;
        final isPlaying = isCurrentTrack && audioState.isPlaying;

        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 300,
                    maxHeight: 300,
                    minHeight: 200,
                    minWidth: 200,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ModernColors.textSecondary,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: CachedNetworkImage(
                        imageUrl: widget.track.coverArtUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, stuff, object) => SizedBox(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  widget.track.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ModernColors.text,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(120),
                      
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ModernColors.textSecondary,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl: widget.track.coverArtUrl ?? "",
                          fit: BoxFit.cover,
                          errorWidget: (context, stuff, object) => SizedBox(),
                        ),
                      ),
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
