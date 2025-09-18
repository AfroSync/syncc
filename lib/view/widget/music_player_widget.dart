import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afrosync/model/track_model.dart';

import '../../controller/audio/audio_state.dart';
import '../../core/color.dart';
import '../track/audio_progress_bar.dart';

class MusicPlayerWidget extends StatefulWidget {
  const MusicPlayerWidget({super.key});

  @override
  State<MusicPlayerWidget> createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  late TrackModel track;

  @override
  void initState() {
    track = TrackModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      child: ValueListenableBuilder<AudioState>(
        valueListenable: AudioStateManager.instance,
        builder: (context, audioState, child) {
          // Don't show player if no track is loaded
          if (!audioState.hasTrack) {
            return const SizedBox.shrink();
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  spacing: 16,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: ModernColors.textSecondary,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Buju Bomo",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ModernColors.text,
                          ),
                        ),
                        Text(
                          "Rema",

                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ModernColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Row(children: [])),
                    InkWell(child: Icon(CupertinoIcons.heart, size: 24)),
                    InkWell(child: Icon(CupertinoIcons.play_fill, size: 24)),
                  ],
                ),
              ),
              AudioProgressBar(),
            ],
          );
        },
      ),
    );
  }
}
