import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncc/model/enums/country.dart';
import 'package:syncc/view/widget/modern_text_field.dart';

import '../../core/color.dart';
import '../../core/responsive.dart';
import '../../core/routes.dart';

class VerificationScreen extends StatelessWidget {
  final String countryCode;

  const VerificationScreen({super.key, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    final country = Country.fromShortCode(countryCode) ?? Country.nigeria;
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "One more step",
                  style: TextStyle(
                    color: ModernColors.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "We would like to collect your number for legal use.",
                  style: TextStyle(
                    color: ModernColors.textSecondary,
                    fontSize: 16,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: 60,
                      child: ModernTextField(
                        "",
                        value: country.phoneCode,
                        align: TextAlign.center,
                        keyboardType: TextInputType.phone,
                      ),
                    ),

                    Expanded(
                      child: ModernTextField(
                        "",
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to HomeWidget after verification
                      context.go(ModernRoutes.home);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: ModernColors.text,
                      padding: isMobile
                          ? EdgeInsetsGeometry.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            )
                          : null,
                    ),

                    child: Text(
                      "Verify",

                      style: TextStyle(
                        color: ModernColors.white,
                        fontSize: 18,

                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
