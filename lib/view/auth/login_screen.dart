import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/color.dart';
import '../../core/responsive.dart';
import '../../core/routes.dart';
import '../widget/modern_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back",
                    style: TextStyle(
                      color: ModernColors.text,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Fill in the information below",
                    style: TextStyle(
                      color: ModernColors.textSecondary,
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 24),
                  Form(
                    child: Column(
                      children: [
                        ModernTextField("Email", onChanged: (text) => email),
                        ModernTextField(
                          "Password",
                          onChanged: (text) => password,
                        ),

                        SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
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
                              "Log In",

                              style: TextStyle(
                                color: ModernColors.white,
                                fontSize: 18,

                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 60),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
