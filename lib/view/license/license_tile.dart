import 'package:flutter/material.dart';
import 'package:syncc/core/color.dart';

class LicenseTile extends StatelessWidget {
  const LicenseTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Honky-Tonk Girl",
                  style: TextStyle(fontSize: 18, height: 1),
                ),
                Text(
                  "Expires Sep 2026",
                  style: TextStyle(
                    fontSize: 14,

                    color: ModernColors.textSecondary,
                  ),
                ),
              ],
            ),

            Spacer(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("No U-Turn", style: TextStyle(fontSize: 18, height: 1)),
                Text(
                  "Ike Nnaebue",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ModernColors.textSecondary,
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
