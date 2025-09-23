import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afrosync/view/widget/text_title_widget.dart';

import '../../core/color.dart';
import '../../core/responsive.dart';
import '../../core/pdf_service.dart';
import '../../model/license_model.dart';

class LicensePaymentScreen extends StatefulWidget {
  final LicenseModel license;

  const LicensePaymentScreen(this.license, {super.key});

  @override
  State<LicensePaymentScreen> createState() => _LicensePaymentScreenState();
}

class _LicensePaymentScreenState extends State<LicensePaymentScreen> {
  late final PdfService _pdfService;

  @override
  void initState() {
    super.initState();
    _pdfService = PdfService.fromServiceLocator;
  }

  Future<void> _openLicenseAgreement() async {
    try {
      final success = await _pdfService.openLicenseAgreement(context: context);
      if (!success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Failed to open license agreement. Please try again.',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening license agreement: $e')),
        );
      }
    }
  }

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
                    "Download receipt",
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
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            TextTitleWidget(
              "Payment Successful",
              horizontalPadding: false,
              verticalPadding: false,
            ),
            Text(
              "Your payment of ₦12,000 was successful. A receipt has been sent to your email. Kindly sign the agreement to claim your license.",
              style: TextStyle(fontSize: 16, color: ModernColors.text),
            ),
            SizedBox(height: 12),
            TextButton(
              onPressed: _openLicenseAgreement,
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
                    CupertinoIcons.pencil_outline,
                    color: ModernColors.white,
                    size: 24,
                  ),
                  Text(
                    "Sign agreement",
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
