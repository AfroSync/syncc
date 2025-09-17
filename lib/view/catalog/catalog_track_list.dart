import 'package:flutter/material.dart';
import 'package:syncc/model/track_model.dart';
import 'package:syncc/view/widget/track_tile.dart';

import '../../api/api_service.dart';

class CatalogTrackList extends StatefulWidget {
  final List<TrackModel> tracks;

  const CatalogTrackList(this.tracks, {super.key});

  @override
  State<CatalogTrackList> createState() => _CatalogTrackListState();
}

class _CatalogTrackListState extends State<CatalogTrackList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: widget.tracks.length,
      itemBuilder: (context, index) {
        final track = widget.tracks[index];
        return TrackTile(track);
      },
    );
  }
}
