import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncc/model/track_model.dart';
import 'package:syncc/view/widget/modern_profile_picker.dart';

import '../../controller/audio/audio_state.dart';
import '../../core/color.dart';
import '../../core/responsive.dart';
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
        final isCurrentTrack = audioState.trackId == widget.track.id;
        final isPlaying = isCurrentTrack && audioState.isPlaying;

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
                      maxWidth: 240,
                      maxHeight: 240,
                      minHeight: 100,
                      minWidth: 100,
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
                  "the day i met her" ?? widget.track.title,
                  style: TextStyle(
                    fontSize: 20,
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
                      ("Bolexyro" ?? widget.track.coverArtUrl).toUpperCase(),
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

                SizedBox(height: 16),

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
