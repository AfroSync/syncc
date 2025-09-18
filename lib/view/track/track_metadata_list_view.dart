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
        TrackMetadataListTile(title: "Name", value: "the day i met her"),
        Divider(thickness: 0.4, endIndent: 12, indent: 12, height: 8),
        TrackMetadataListTile(title: "Artist", value: "Bolexyro"),
      ],
    );
  }
}
