import 'package:flutter/material.dart';
import 'package:syncc/core/color.dart';
import 'package:syncc/model/track_model.dart';
import 'package:syncc/view/track/track_tile.dart';

import '../widget/text_title_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitleWidget("Profile"),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 30),
                      Spacer(),
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.edit, color: ModernColors.text),
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.settings),
                        color: ModernColors.text,
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  Text(
                    "Adebola Oduwfa",
                    style: TextStyle(fontSize: 20, height: 1),
                  ),
                  Text(
                    "Artist",
                    style: TextStyle(color: ModernColors.textSecondary),
                  ),
                  SizedBox(height: 24),
                  Text("Tracks", style: TextStyle(fontSize: 18)),
                  Divider(),
                  Column(
                    children: [
                      TrackTile(TrackModel(), addHorizontalPadding: false),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
