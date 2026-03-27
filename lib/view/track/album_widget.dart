import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/color.dart';
import '../../data/mock_data.dart';

class AlbumWidget extends StatelessWidget {
  final MockAlbum album;

  const AlbumWidget({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(6),
      child: SizedBox(
        width: 110,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 110,
                width: 110,
                color: ModernColors.textSecondary.withOpacity(0.2),
                child: CachedNetworkImage(
                  imageUrl: album.coverArtUrl,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) => Center(
                    child: Icon(
                      Icons.album,
                      color: ModernColors.textSecondary,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              album.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${album.year} · ${album.trackCount} tracks',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: ModernColors.textSecondary,
                fontSize: 12,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
