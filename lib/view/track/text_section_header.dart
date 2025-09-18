import 'package:flutter/material.dart';

import '../../core/color.dart';

class TextSectionHeader extends StatelessWidget {
  final String title;
  final String? buttonTitle;
  final IconData? buttonIcon;
  final VoidCallback? onTap;
  final List<Widget> section;

  const TextSectionHeader(
    this.title, {
    super.key,
    this.buttonTitle,
    this.buttonIcon,
    this.onTap,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(title, style: TextStyle(fontSize: 18, height: 1)),
                  Spacer(),
                  if (buttonTitle != null)
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: TextButton(
                        onPressed: onTap,
                        style: TextButton.styleFrom(
                          padding: EdgeInsetsGeometry.symmetric(
                            vertical: 0,
                            horizontal: 0,
                          ),
                          backgroundColor: ModernColors.activeBlue,
                        ),
                        child: Row(
                          spacing: 4,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (buttonIcon != null)
                              Icon(
                                buttonIcon,
                                color: ModernColors.white,
                                size: 18,
                              ),

                            // Text(
                            //   buttonTitle!,
                            //   style: TextStyle(
                            //     color: ModernColors.white,
                            //     fontSize: 12,
                            //     fontWeight: FontWeight.w700,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(width: 4),
                ],
              ),
              Divider(height: 8),
            ],
          ),
        ),
        SizedBox(height: 4),
        ...section,
        SizedBox(height: 24),
      ],
    );
  }
}
