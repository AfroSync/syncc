import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/color.dart';

class ProductionLicenseListTile extends StatelessWidget {
  final String title;
  final String value;

  const ProductionLicenseListTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showProductionLicenseDetails(context, title, value);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: ModernColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(fontSize: 16, color: ModernColors.text),

              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}

void showProductionLicenseDetails(
  BuildContext context,
  String title,
  String value,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,

    builder: (context) => ProductionLicenseDetails(title, value),
  );
}

class ProductionLicenseDetails extends StatefulWidget {
  final String title;
  final String value;

  const ProductionLicenseDetails(this.title, this.value, {super.key});

  @override
  State<ProductionLicenseDetails> createState() =>
      _ProductionLicenseDetailsState();
}

class _ProductionLicenseDetailsState extends State<ProductionLicenseDetails> {
  String? selectedMovie;

  final List<String> movies = [
    "No U-Turn",
    "Under Your Skin",
    "My Rich Boyfriend",
    "Choked",
    "Loving Daniella",
    "Besieged",
  ];

  @override
  void initState() {
    super.initState();
    // Pre-select the first movie
    selectedMovie = movies.first;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      maxChildSize: 0.85,
      snap: true,
      snapSizes: [0.55, 0.75, 0.85],
      expand: false,

      builder: (context, scrollController) => SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              height: 4,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ModernColors.textSecondary,
              ),
              margin: EdgeInsetsGeometry.only(top: 20),
            ),

            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 24,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Text(
                          "License for",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: ModernColors.text,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          height: 32,
                          child: TextButton(
                            onPressed: null,
                            style: TextButton.styleFrom(
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: 0,
                                horizontal: 8,
                              ),
                              backgroundColor: ModernColors.activeBlue,
                            ),
                            child: Row(
                              spacing: 4,
                              children: [
                                Icon(
                                  CupertinoIcons.add,
                                  color: ModernColors.white,
                                ),
                                Text(
                                  "Add production",
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
                      ],
                    ),
                    SizedBox(height: 4),

                    Text(
                      "Your productions available:",
                      style: TextStyle(fontSize: 16, color: ModernColors.text),
                    ),
                    SizedBox(height: 12),

                    // Radio buttons for movies
                    ...movies.map((movie) => _buildMovieRadioOption(movie)),

                    SizedBox(height: 16),

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: ModernColors.text),
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: ModernColors.text),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              // TODO: Handle save logic with selectedMovie
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: ModernColors.text,
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              "Select",
                              style: TextStyle(color: ModernColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieRadioOption(String movie) {
    final isSelected = selectedMovie == movie;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMovie = movie;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        color: Colors.transparent,
        child: Row(
          children: [
            // Radio button
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? ModernColors.activeBlue
                      : ModernColors.textSecondary,
                  width: 2,
                ),
                color: isSelected
                    ? ModernColors.activeBlue
                    : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 12, color: ModernColors.white)
                  : null,
            ),
            SizedBox(width: 12),

            // Movie name
            Expanded(
              child: Text(
                movie,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? ModernColors.activeBlue
                      : ModernColors.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
