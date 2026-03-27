import 'package:flutter/material.dart';

import '../../core/color.dart';
import '../../core/responsive.dart';
import '../../data/mock_data.dart';
import '../widget/text_title_widget.dart';
import 'license_tile.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> with AutomaticKeepAliveClientMixin {
  InquiryStatus? _filter;

  @override
  bool get wantKeepAlive => true;

  List<MockLicensingInquiry> get _filtered =>
      _filter == null ? mockInquiries : mockInquiries.where((i) => i.status == _filter).toList();

  int _count(InquiryStatus status) => mockInquiries.where((i) => i.status == status).length;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              TextTitleWidget("Licenses"),
              Spacer(),
              SizedBox(
                height: 32,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: isMobile ? const EdgeInsets.symmetric(vertical: 0, horizontal: 8) : null,
                    backgroundColor: ModernColors.activeBlue,
                  ),
                  child: Row(
                    spacing: 4,
                    children: [
                      const Icon(Icons.add, color: ModernColors.white, size: 16),
                      const Text(
                        "New request",
                        style: TextStyle(color: ModernColors.white, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          Expanded(
            child: _filtered.isEmpty
                ? Center(
                    child: Text(
                      'No ${_filter?.name ?? ''} inquiries',
                      style: TextStyle(color: ModernColors.textSecondary, fontSize: 15),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 24),
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) => LicenseTile(inquiry: _filtered[index]),
                  ),
          ),
        ],
      ),
    );
  }
}
