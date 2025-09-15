import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncc/core/color.dart';
import 'package:syncc/core/routes.dart';

class AuthChoiceScreen extends StatelessWidget {
  const AuthChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(),
                Spacer(),

                Text(
                  "AfroSync™",
                  style: TextStyle(
                    color: ModernColors.text,
                    fontWeight: FontWeight.w700,
                    fontSize: 60,

                    height: 1,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "We make licensing music easier than ever before. \nLet's get you started.",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: ModernColors.textSecondary,

                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                    letterSpacing: 1.4,
                  ),
                ),
                SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () =>
                        context.push(ModernRoutes.producerSignupScreen),
                    style: TextButton.styleFrom(
                      backgroundColor: ModernColors.text,
                    ),
                    child: Text(
                      "Film Producer",
                      style: TextStyle(
                        color: ModernColors.white,
                        fontSize: 18,
                        fontFamily: "",

                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,

                  child: OutlinedButton(
                    onPressed: () =>
                        context.push(ModernRoutes.artistSignupScreen),

                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: ModernColors.text,
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),

                    child: Text(
                      "Music Artist",
                      style: TextStyle(
                        color: ModernColors.text,
                        fontSize: 18,
                        fontFamily: "",

                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text("log in to an existing account"),
                ),

                Spacer(),
                MouseRegion(
                  cursor: SystemMouseCursors.click,

                  child: Text("browse the music catalog"),
                ),
                SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
