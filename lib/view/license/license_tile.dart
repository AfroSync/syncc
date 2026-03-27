import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afrosync/core/color.dart';

import '../../data/mock_data.dart';
import 'license_detail_screen.dart';

class LicenseTile extends StatelessWidget {
  final MockLicensingInquiry inquiry;

  const LicenseTile({super.key, required this.inquiry});

  Color get _statusColor {
    switch (inquiry.status) {
      case InquiryStatus.approved:
        return ModernColors.active;
      case InquiryStatus.declined:
        return ModernColors.error;
      case InquiryStatus.countered:
        return ModernColors.activeBlue;
      case InquiryStatus.pending:
        return const Color(0xFFF5A623);
    }
  }

  String get _statusLabel {
    switch (inquiry.status) {
      case InquiryStatus.approved:
        return 'Approved';
      case InquiryStatus.declined:
        return 'Declined';
      case InquiryStatus.countered:
        return 'Countered';
      case InquiryStatus.pending:
        return 'Pending';
    }
  }

  IconData get _requesterIcon {
    switch (inquiry.requesterType) {
      case RequesterType.filmmaker:
        return CupertinoIcons.film;
      case RequesterType.adAgency:
        return CupertinoIcons.briefcase;
      case RequesterType.podcast:
        return CupertinoIcons.mic;
      case RequesterType.streamingPlatform:
        return CupertinoIcons.play_rectangle;
      case RequesterType.tvNetwork:
        return CupertinoIcons.tv;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LicenseDetailScreen(inquiry: inquiry))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: ModernColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ModernColors.textSecondary.withOpacity(0.15)),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left accent bar
                Container(
                  width: 2.5,
                  decoration: BoxDecoration(
                    color: _statusColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        // Top row: requester + status badge
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: ModernColors.textSecondary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(_requesterIcon, size: 16, color: ModernColors.text),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                inquiry.requesterName,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: _statusColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                _statusLabel,
                                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: _statusColor),
                              ),
                            ),
                          ],
                        ),
                        // Track name + usage
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 2,
                          children: [
                            Text(
                              inquiry.trackRequested,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, height: 1),
                            ),
                            Text(
                              inquiry.usageType,
                              style: TextStyle(fontSize: 13, color: ModernColors.textSecondary),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        // Bottom row: territory + date
                        Row(
                          children: [
                            Icon(CupertinoIcons.globe, size: 12, color: ModernColors.textSecondary),
                            const SizedBox(width: 4),
                            Text(inquiry.territory, style: TextStyle(fontSize: 12, color: ModernColors.textSecondary)),
                            const Spacer(),
                            Text(
                              _formatDate(inquiry.submittedDate),
                              style: TextStyle(fontSize: 12, color: ModernColors.textSecondary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
