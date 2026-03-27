import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/color.dart';
import '../../data/mock_data.dart';

class LicenseDetailScreen extends StatelessWidget {
  final MockLicensingInquiry inquiry;

  const LicenseDetailScreen({super.key, required this.inquiry});

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
        return CupertinoIcons.mic_solid;
      case RequesterType.streamingPlatform:
        return CupertinoIcons.play_rectangle_fill;
      case RequesterType.tvNetwork:
        return CupertinoIcons.tv_fill;
    }
  }

  String get _requesterTypeLabel {
    switch (inquiry.requesterType) {
      case RequesterType.filmmaker:
        return 'Filmmaker';
      case RequesterType.adAgency:
        return 'Ad Agency';
      case RequesterType.podcast:
        return 'Podcast';
      case RequesterType.streamingPlatform:
        return 'Streaming Platform';
      case RequesterType.tvNetwork:
        return 'TV Network';
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final bool canAct = inquiry.status == InquiryStatus.pending ||
        inquiry.status == InquiryStatus.countered;

    return Scaffold(
      backgroundColor: ModernColors.background,
      appBar: AppBar(
        backgroundColor: ModernColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: ModernColors.text),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'License Request',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ModernColors.text,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: _statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _statusLabel,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: _statusColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero header card
                  Container(
                    color: ModernColors.white,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: ModernColors.textSecondary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            _requesterIcon,
                            size: 26,
                            color: ModernColors.text,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Text(
                                inquiry.requesterName,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                ),
                              ),
                              Text(
                                _requesterTypeLabel,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: ModernColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Track info section
                  _Section(
                    title: 'Track Requested',
                    children: [
                      _DetailRow(
                        icon: CupertinoIcons.music_note,
                        label: 'Track',
                        value: inquiry.trackRequested,
                      ),
                      _DetailRow(
                        icon: CupertinoIcons.square_list,
                        label: 'Usage Type',
                        value: inquiry.usageType,
                      ),
                      _DetailRow(
                        icon: CupertinoIcons.globe,
                        label: 'Territory',
                        value: inquiry.territory,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Project details section
                  _Section(
                    title: 'Project Details',
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Text(
                          inquiry.projectDescription,
                          style: TextStyle(
                            fontSize: 15,
                            color: ModernColors.text,
                            height: 1.55,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Submission info
                  _Section(
                    title: 'Submission',
                    children: [
                      _DetailRow(
                        icon: CupertinoIcons.calendar,
                        label: 'Submitted',
                        value: _formatDate(inquiry.submittedDate),
                      ),
                      _DetailRow(
                        icon: CupertinoIcons.tag,
                        label: 'Type',
                        value: _requesterTypeLabel,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Action buttons
          if (canAct) ...[
            Container(
              decoration: BoxDecoration(
                color: ModernColors.white,
                border: Border(
                  top: BorderSide(
                    color: ModernColors.textSecondary.withOpacity(0.15),
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(
                16,
                12,
                16,
                12 + MediaQuery.of(context).padding.bottom,
              ),
              child: Row(
                spacing: 10,
                children: [
                  // Decline
                  Expanded(
                    child: _ActionButton(
                      label: 'Decline',
                      color: ModernColors.error,
                      outlined: true,
                      onTap: () => _showConfirm(
                        context,
                        title: 'Decline Request?',
                        message:
                            'This will notify ${inquiry.requesterName} that their request has been declined.',
                        confirmLabel: 'Decline',
                        confirmColor: ModernColors.error,
                      ),
                    ),
                  ),
                  // Counter
                  Expanded(
                    child: _ActionButton(
                      label: 'Counter',
                      color: ModernColors.activeBlue,
                      outlined: true,
                      onTap: () {},
                    ),
                  ),
                  // Approve
                  Expanded(
                    flex: 2,
                    child: _ActionButton(
                      label: 'Approve',
                      color: ModernColors.active,
                      outlined: false,
                      onTap: () => _showConfirm(
                        context,
                        title: 'Approve Request?',
                        message:
                            'This will approve the licensing request and notify ${inquiry.requesterName}.',
                        confirmLabel: 'Approve',
                        confirmColor: ModernColors.active,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            Container(
              decoration: BoxDecoration(
                color: ModernColors.white,
                border: Border(
                  top: BorderSide(
                    color: ModernColors.textSecondary.withOpacity(0.15),
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(
                16,
                12,
                16,
                12 + MediaQuery.of(context).padding.bottom,
              ),
              child: SizedBox(
                width: double.infinity,
                child: _ActionButton(
                  label: 'View Contract',
                  color: ModernColors.primary,
                  outlined: false,
                  onTap: () {},
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showConfirm(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
    required Color confirmColor,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        content: Text(message,
            style:
                TextStyle(fontSize: 14, color: ModernColors.textSecondary)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel',
                style: TextStyle(color: ModernColors.textSecondary)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(confirmLabel,
                style: TextStyle(
                    color: confirmColor, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

// ── Reusable section wrapper ──────────────────────────────────────────────────

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _Section({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ModernColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
                color: ModernColors.textSecondary,
              ),
            ),
          ),
          const Divider(height: 1, thickness: 0.4),
          ...children,
        ],
      ),
    );
  }
}

// ── Detail row ────────────────────────────────────────────────────────────────

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 16, color: ModernColors.textSecondary),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: ModernColors.textSecondary,
            ),
          ),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: ModernColors.text,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Action button ─────────────────────────────────────────────────────────────

class _ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final bool outlined;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.color,
    required this.outlined,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: outlined ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color,
            width: outlined ? 1.5 : 0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: outlined ? color : ModernColors.white,
          ),
        ),
      ),
    );
  }
}
