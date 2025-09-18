import 'package:flutter/material.dart';

import '../../core/color.dart';

class TrackMetadataListTile extends StatelessWidget {
  final String title;
  final String value;

  const TrackMetadataListTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: ModernColors.textSecondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: ModernColors.text),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
