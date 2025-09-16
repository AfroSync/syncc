import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncc/model/producer/producer_model.dart';

import '../../core/color.dart';
import '../../core/routes.dart';
import '../widget/modern_country_picker.dart';
import '../widget/modern_genre_picker.dart';
import '../widget/modern_profile_picker.dart';
import '../widget/modern_text_field.dart';

class ProducerSignupScreen extends StatefulWidget {
  const ProducerSignupScreen({super.key});

  @override
  State<ProducerSignupScreen> createState() => _ProducerSignupScreenState();
}

class _ProducerSignupScreenState extends State<ProducerSignupScreen> {
  late final ProducerModel model;

  @override
  void initState() {
    model = ProducerModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    "Browse through endless content",
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
                          onChanged: (text) => model.username = text,
                        ),
                        ModernTextField(
                          "Full name",
                          onChanged: (text) => model.fullName = text,
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
                          onChanged: (country) => model.country = country,
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
                                  model.country.shortCode,
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: ModernColors.text,
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
