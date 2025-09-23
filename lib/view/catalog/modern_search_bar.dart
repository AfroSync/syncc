import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:afrosync/core/color.dart';

class ModernSearchBar extends StatefulWidget {
  final Function(String keyword) onSearch;

  const ModernSearchBar({super.key, required this.onSearch});

  @override
  State<ModernSearchBar> createState() => _ModernSearchBarState();
}

class _ModernSearchBarState extends State<ModernSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            "Scene Finder",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: ModernColors.text,
              height: 1.3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              "Instantly identify sounds to fit the perfect scene",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ModernColors.text.withOpacity(0.8),

                height: 1,
              ),

              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText:
                  "eg. Lagos marketplace with vendors, street food, and Afrobeat music.",

              hintStyle: TextStyle(
                color: ModernColors.textSecondary,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.3,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),

              contentPadding: EdgeInsetsGeometry.only(
                left: 8,
                right: 8,
                top: 4,
                bottom: 12,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Coming Soon...",

            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: ModernColors.textSecondary.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
