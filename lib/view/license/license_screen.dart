import 'package:flutter/material.dart';

import '../../core/color.dart';
import '../../core/responsive.dart';
import '../widget/text_title_widget.dart';
import 'license_tile.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
                    padding: isMobile
                        ? EdgeInsetsGeometry.symmetric(
                            vertical: 0,
                            horizontal: 8,
                          )
                        : null,
                    backgroundColor: ModernColors.activeBlue,
                  ),
                  child: Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.add, color: ModernColors.white),
                      Text(
                        "Create license",
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
              SizedBox(width: 20),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LicenseTile(),
                  Divider(indent: 24, endIndent: 24, thickness: 0.4, height: 1),
                  LicenseTile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
