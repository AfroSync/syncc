import 'package:flutter/material.dart';

import '../../core/color.dart';

class LicenseSummaryListTile extends StatelessWidget {
  final String title;
  final String value;
  final List<String> values;

  const LicenseSummaryListTile({
    super.key,
    required this.title,
    required this.value,
  }) : values = const [];

  const LicenseSummaryListTile.list({
    super.key,
    required this.title,
    required this.values,
  }) : value = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: ModernColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          if (value.isNotEmpty)
            Text(
              value,
              style: TextStyle(fontSize: 16, color: ModernColors.text),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          if (values.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 6,
              children: values
                  .map(
                    (item) => Text(
                      item,
                      style: TextStyle(fontSize: 16, color: ModernColors.text),

                      textAlign: TextAlign.right,
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
