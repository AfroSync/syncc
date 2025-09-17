import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncc/core/color.dart';
import 'package:syncc/core/responsive.dart';
import 'package:syncc/core/routes.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 32, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "AfroSync™",
                  style: TextStyle(
                    color: ModernColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
                Spacer(),
                if (false ?? isMobile)
                  Icon(Icons.menu, color: ModernColors.white, size: 30),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,

                children: [
                  Text(
                    "Music For \nExceptional \nCreators",
                    textAlign: isMobile ? TextAlign.center : null,
                    style: TextStyle(
                      color: ModernColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: isMobile ? 52 : 80,

                      height: 1,
                    ),
                  ),
                  Row(),
                  SizedBox(height: 38),
                  if (false ?? !isMobile) ...[
                    Text(
                      "Get a license that covers any project.",

                      style: TextStyle(
                        color: ModernColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,

                        height: 1,
                      ),
                    ),

                    SizedBox(height: 24),
                  ],
                  TextButton(
                    onPressed: () => context.go(ModernRoutes.authChoice),
                    style: TextButton.styleFrom(
                      backgroundColor: ModernColors.white,
                      padding: isMobile
                          ? EdgeInsetsGeometry.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            )
                          : null,
                    ),
                    child: Text(
                      "Browse music",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Music by",

                      style: TextStyle(
                        color: ModernColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        height: 1,
                      ),
                    ),
                    Text(
                      "Fops",

                      style: TextStyle(
                        color: ModernColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
