import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afrosync/core/color.dart';

import '../../core/responsive.dart';

class LicenseTile extends StatelessWidget {
  const LicenseTile({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          spacing: 12,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: ModernColors.textSecondary.withOpacity(0.4),
                  child: Icon(
                    CupertinoIcons.mic_solid,
                    color: ModernColors.text,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Sync License",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                
                  child: Icon(CupertinoIcons.forward),
                ),
              ],
            ),
            Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "No U-Turn",
                      style: TextStyle(fontSize: 18, height: 1),
                    ),
                    Text(
                      "Nnaebue Productions",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ModernColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      // Text(
                      //   "the day i met her",
                      //   style: TextStyle(fontSize: 18, height: 1),
                      // ),
                      Text(
                        "Active till 2026",
                        style: TextStyle(
                          fontSize: 14,

                          color: ModernColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
