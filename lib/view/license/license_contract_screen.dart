import 'package:afrosync/model/enums/license_terms.dart';
import 'package:afrosync/view/license/production_license_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:afrosync/view/license/negotiation_bottom_sheet.dart';

import '../../core/color.dart';
import '../../core/responsive.dart';
import '../../core/routes.dart';
import '../../model/track_model.dart';
import 'license_summary_list_tile.dart';

class LicenseContractScreen extends StatefulWidget {
  final TrackModel track;

  const LicenseContractScreen(this.track, {super.key});

  @override
  State<LicenseContractScreen> createState() => _LicenseContractScreenState();
}

class _LicenseContractScreenState extends State<LicenseContractScreen> {
  final List<BaseTerm> terms = [
    // PaymentPresets(),
    TerritoryPresets(),
    ExclusivityPresets(),
    UsageRightsPresets(),
    PerformingRightsPresets(),
    ApprovalLevels(),
    CreditPresets(),
    ModificationLevels(),
    RenewalOptions(),
    TerminationTriggers(),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            height: 32,
            child: TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                padding: isMobile
                    ? EdgeInsetsGeometry.symmetric(vertical: 0, horizontal: 8)
                    : null,
                backgroundColor: ModernColors.text.withValues(alpha: 0.9),
              ),
              child: Row(
                spacing: 4,
                children: [
                  Icon(CupertinoIcons.bookmark_fill, color: ModernColors.white),
                  Text(
                    "Save",
                    style: TextStyle(
                      color: ModernColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),

          SizedBox(
            height: 32,
            child: TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                padding: isMobile
                    ? EdgeInsetsGeometry.symmetric(vertical: 0, horizontal: 8)
                    : null,
                backgroundColor: ModernColors.activeBlue,
              ),
              child: Row(
                spacing: 4,
                children: [
                  Icon(
                    CupertinoIcons.download_circle_fill,
                    color: ModernColors.white,
                  ),
                  Text(
                    "View full agreement",
                    style: TextStyle(
                      color: ModernColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        widget.track.title,

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.track.artistName,
                        style: TextStyle(
                          fontSize: 14,
                          color: ModernColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Text(
                      "₦12,000",

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "one-time payment",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1,
                        color: ModernColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(thickness: 0.7),
            ProductionLicenseListTile(title: 'License for', value: 'No U-Turn'),
            ...terms.map((term) => LicenseSummaryListTile<BaseTerm>(term)),
            Divider(thickness: 0.7),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                NegotiationBottomSheet.show(context, terms);
              },

              style: OutlinedButton.styleFrom(
                padding: isMobile
                    ? EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16)
                    : null,
                side: BorderSide(color: ModernColors.text),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,

                children: [
                  Icon(Icons.edit, color: ModernColors.text, size: 24),
                  Text(
                    "Negotiate terms",
                    style: TextStyle(fontSize: 16, color: ModernColors.text),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            TextButton(
              onPressed: () {
                // Create a license ID from the track ID for payment
                final licenseId = 'license_${widget.track.id}';
                context.push(ModernRoutes.licensePayment(licenseId));
              },
              style: TextButton.styleFrom(
                padding: isMobile
                    ? EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16)
                    : null,
                backgroundColor: ModernColors.text,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Icon(
                    CupertinoIcons.download_circle_fill,
                    color: ModernColors.white,
                    size: 24,
                  ),
                  Text(
                    "Buy license",
                    style: TextStyle(fontSize: 16, color: ModernColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
