import 'package:flutter/material.dart';
import 'package:afrosync/model/license_model.dart';
import 'package:afrosync/view/widget/text_title_widget.dart';

import '../../core/color.dart';
import '../../core/responsive.dart';

class NegotiationBottomSheet extends StatefulWidget {
  final LicenseModel license;

  const NegotiationBottomSheet(this.license, {super.key});

  /// Show the negotiation bottom sheet
  static void show(BuildContext context, LicenseModel license) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (context) => NegotiationBottomSheet(license),
    );
  }

  @override
  State<NegotiationBottomSheet> createState() => _NegotiationBottomSheetState();
}

class _NegotiationBottomSheetState extends State<NegotiationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return BottomSheet(
      onClosing: () {},

      builder: (context) {
        return DraggableScrollableSheet(
          builder: (context, controller) {
            return SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  TextTitleWidget("Negotiation"),

                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: isMobile
                          ? EdgeInsetsGeometry.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            )
                          : null,
                      // backgroundColor: ModernColors.text,
                    ),
                    child: Text(
                      "Need something different?",

                      style: TextStyle(
                        fontSize: 16,
                        color: ModernColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
