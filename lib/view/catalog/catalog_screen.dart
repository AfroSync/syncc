import 'package:flutter/material.dart';
import 'package:afrosync/model/track_model.dart';
import 'package:afrosync/view/catalog/catalog_track_list.dart';
import 'package:afrosync/view/widget/text_title_widget.dart';
import 'package:afrosync/view/track/audio_player_widget.dart';

import '../../api/api_service.dart';
import 'modern_search_bar.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen>
    with AutomaticKeepAliveClientMixin {
  List<TrackModel> tracks = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    loadTracks();
    super.initState();
  }

  void loadTracks() async {
    final response = await ApiService.instance.tracks.getTracksHomepage(
      limit: 20,
    );
    if (response.success) {
      setState(() {
        tracks = response.data!.tracks;
      });
    } else {
      print("Error loading tracks");
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitleWidget("Featured Music"),

          Expanded(
            child: tracks.isEmpty
                ? Center(child: CircularProgressIndicator.adaptive())
                : CatalogTrackList(tracks),
          ),
        ],
      ),
    );
  }
}
