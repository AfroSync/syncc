import 'package:flutter/material.dart';
import 'package:afrosync/view/track/track_metadata_list_tile.dart';

import '../../model/track_model.dart';

class TrackMetadataListView extends StatelessWidget {
  final TrackModel track;

  const TrackMetadataListView(this.track, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Metadata", style: TextStyle(fontSize: 18, height: 1)),
        Divider(),

        // Basic track info
        TrackMetadataListTile(
          title: "Release Year",
          value: track.releaseDate.year.toString(),
        ),

        Divider(thickness: 0.4, endIndent: 12, indent: 12, height: 8),
        TrackMetadataListTile(title: "Genre", value: track.metadata.genre),

        if (track.metadata.mood != 'Unknown') ...[
          Divider(thickness: 0.4, endIndent: 12, indent: 12, height: 8),
          TrackMetadataListTile(title: "Mood", value: track.metadata.mood),
        ],
        if (track.metadata.tempo != 'Unknown') ...[
          Divider(thickness: 0.4, endIndent: 12, indent: 12, height: 8),
          TrackMetadataListTile(title: "Tempo", value: track.metadata.tempo),
        ],
        if (track.metadata.build != 'Unknown') ...[
          Divider(thickness: 0.4, endIndent: 12, indent: 12, height: 8),
          TrackMetadataListTile(title: "Build", value: track.metadata.build),
        ],
        if (track.metadata.vocalType != 'Unknown') ...[
          Divider(thickness: 0.4, endIndent: 12, indent: 12, height: 8),
          TrackMetadataListTile(
            title: "Vocal Type",
            value: track.metadata.vocalType,
          ),
        ],

        // Instrumentation
        if (track.metadata.instrumentation.isNotEmpty) ...[
          Divider(thickness: 0.4, endIndent: 12, indent: 12, height: 8),
          TrackMetadataListTile(
            title: "Instrumentation",
            value: track.metadata.instrumentation.join(", "),
          ),
        ],

        // Scene suitability
        if (track.metadata.sceneSuitability.isNotEmpty) ...[
          Divider(thickness: 0.4, endIndent: 12, indent: 12, height: 8),
          TrackMetadataListTile(
            title: "Scene Suitability",
            value: track.metadata.sceneSuitability.join(", "),
          ),
        ],

        // Special flags
        if (track.metadata.instrumentalOnly || track.metadata.lyricalOnly) ...[
          Divider(thickness: 0.4, endIndent: 12, indent: 12, height: 8),
          TrackMetadataListTile(
            title: "Type",
            value: track.metadata.instrumentalOnly
                ? "Instrumental Only"
                : track.metadata.lyricalOnly
                ? "Lyrical Only"
                : "Mixed",
          ),
        ],

        // Description
        if (track.description.isNotEmpty) ...[
          Divider(thickness: 0.4, endIndent: 12, indent: 12, height: 8),
          TrackMetadataListTile(title: "Description", value: track.description),
        ],
      ],
    );
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return "${minutes}:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
