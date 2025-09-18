import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:afrosync/core/color.dart';
import 'package:afrosync/core/routes.dart';
import 'package:afrosync/model/track_model.dart';
import 'package:afrosync/view/track/text_section_header.dart';
import 'package:afrosync/view/track/track_tile.dart';

import '../track/album_widget.dart';
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
    super.build(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitleWidget("Profile"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                CircleAvatar(radius: 30),
                                Spacer(),
                                IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.edit,
                                    color: ModernColors.text,
                                  ),
                                ),
                                IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.settings,
                                    color: ModernColors.text,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Malik Afegbua",
                              style: TextStyle(fontSize: 20, height: 1),
                            ),
                            Text(
                              "Artist",
                              style: TextStyle(
                                color: ModernColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
                      TextSectionHeader(
                        "Albums",
                        buttonIcon: CupertinoIcons.plus,
                        buttonTitle: "Create",
                        onTap: () => context.push(
                          ModernRoutes.createTrack,
                        ), // TODO: Create separate album creation route

                        section: [
                          // AlbumWidget(),
                          SizedBox(
                            width: constraints.maxWidth,

                            height: 180,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),

                              child: Row(
                                spacing: 12,

                                children: [
                                  AlbumWidget(),
                                  AlbumWidget(),
                                  AlbumWidget(),
                                  AlbumWidget(),
                                  AlbumWidget(),
                                  AlbumWidget(),
                                  AlbumWidget(),
                                  AlbumWidget(),
                                  AlbumWidget(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextSectionHeader(
                        "Tracks",
                        buttonIcon: CupertinoIcons.plus,
                        buttonTitle: "Create",
                        onTap: () => context.push(ModernRoutes.createTrack),
                        section: [TrackTile(TrackModel(), showArtist: false)],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
