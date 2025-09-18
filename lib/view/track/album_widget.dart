import 'package:flutter/material.dart';

import '../../core/color.dart';

class AlbumWidget extends StatelessWidget {
  const AlbumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(4),

      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Container(
              height: 100,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ModernColors.textSecondary,
              ),
            ),
            SizedBox(),
            Text(
              "Jonny Vibes",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
            Text(
              "2023",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: ModernColors.textSecondary,
                fontSize: 14,
                height: 1,
              ),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
