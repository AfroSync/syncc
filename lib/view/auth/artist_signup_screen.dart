import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:afrosync/core/color.dart';
import 'package:afrosync/core/routes.dart';
import 'package:afrosync/model/user/artist_model.dart';
import 'package:afrosync/view/widget/modern_country_picker.dart';
import 'package:afrosync/view/widget/modern_genre_picker.dart';
import 'package:afrosync/view/widget/modern_text_field.dart';

import '../../core/responsive.dart';
import '../widget/modern_profile_picker.dart';

class ArtistSignupScreen extends StatefulWidget {
  const ArtistSignupScreen({super.key});

  @override
  State<ArtistSignupScreen> createState() => _ArtistSignupScreenState();
}

class _ArtistSignupScreenState extends State<ArtistSignupScreen> {
  late final ArtistModel model;

  @override
  void initState() {
    model = ArtistModel();
    super.initState();
  }

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
                    "Welcome young artist.",
                    style: TextStyle(
                      color: ModernColors.text,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "There's some information we need to get you started, please fill the details below.",
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
                        ModernProfilePicker(),
                        ModernTextField(
                          "Artist/Band name",
                          onChanged: (text) => model.stageName = text,
                        ),
                        ModernTextField(
                          "Full name",
                          onChanged: (text) {
                            model.firstName =
                                text.split(" ").elementAtOrNull(1) ?? "";
                            model.lastName =
                                text.split(" ").elementAtOrNull(1) ?? "";
                          },
                        ),
                        ModernTextField(
                          "Email",
                          onChanged: (text) => model.email = text,
                        ),
                        ModernTextField(
                          "Password",
                          onChanged: (text) => model.password = text,
                          shouldObscure: true,
                        ),
                        ModernCountryPicker(
                          onChanged: (country) =>
                              model.countryCode = country.shortCode,
                        ),
                        ModernGenrePicker(
                          onChanged: (genres) => model.genres = genres,
                        ),
                        SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              context.go(
                                ModernRoutes.verificationScreen(
                                  model.countryCode,
                                ),
                              );
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
                              "Submit",

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
