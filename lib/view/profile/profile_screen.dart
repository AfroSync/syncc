import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:afrosync/core/color.dart';
import 'package:afrosync/core/routes.dart';
import 'package:afrosync/data/mock_data.dart';
import 'package:afrosync/model/mock_tracks.dart';
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

  // Use the first mock artist as the profile subject
  final _artist = mockArtists.first;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final bio = mockArtistBios[_artist.stageName] ?? '';
    final trackCount = mockArtistTrackCounts[_artist.stageName] ?? 0;
    final verified = mockArtistVerified[_artist.stageName] ?? false;
    // Show first 6 tracks from the catalog as this artist's tracks
    final tracks = MockTracks.all.take(6).toList();

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
                      // ── Profile header ──────────────────────────────────
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 34,
                                  backgroundColor:
                                      ModernColors.textSecondary.withOpacity(0.2),
                                  child: Text(
                                    _artist.stageName
                                        .substring(0, 1)
                                        .toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: ModernColors.text,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    color: ModernColors.text,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.settings_outlined,
                                    color: ModernColors.text,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  _artist.stageName,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                  ),
                                ),
                                if (verified)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: ModernColors.active.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      spacing: 3,
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(
                                          Icons.verified,
                                          size: 12,
                                          color: ModernColors.active,
                                        ),
                                        Text(
                                          'Verified',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: ModernColors.active,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _artist.genres
                                  .map((g) => g.name)
                                  .join(' · '),
                              style: TextStyle(
                                color: ModernColors.textSecondary,
                                fontSize: 13,
                              ),
                            ),
                            if (bio.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Text(
                                bio,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ModernColors.text.withOpacity(0.75),
                                  height: 1.5,
                                ),
                              ),
                            ],
                            const SizedBox(height: 16),
                            // Stats row
                            Row(
                              spacing: 24,
                              children: [
                                _StatItem(
                                    label: 'Tracks', value: '$trackCount'),
                                _StatItem(
                                    label: 'Albums',
                                    value: '${mockAlbums.length}'),
                                _StatItem(label: 'Licenses', value: '14'),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),

                      // ── Albums ──────────────────────────────────────────
                      TextSectionHeader(
                        "Albums",
                        buttonIcon: CupertinoIcons.plus,
                        buttonTitle: "Create",
                        onTap: () => context.push(ModernRoutes.createTrack),
                        section: [
                          SizedBox(
                            width: constraints.maxWidth,
                            height: 185,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              child: Row(
                                spacing: 14,
                                children: mockAlbums
                                    .map((a) => AlbumWidget(album: a))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // ── Tracks ──────────────────────────────────────────
                      TextSectionHeader(
                        "Tracks",
                        buttonIcon: CupertinoIcons.plus,
                        buttonTitle: "Upload",
                        onTap: () => context.push(ModernRoutes.createTrack),
                        section: tracks
                            .map((t) => TrackTile(t, showArtist: false))
                            .toList(),
                      ),

                      const SizedBox(height: 36),
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

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: ModernColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
