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
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search title, artists, mood",
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: ModernColors.textSecondary,
          ),
          hintStyle: TextStyle(color: ModernColors.textSecondary),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(400)),
          constraints: BoxConstraints(maxHeight: 40),
          contentPadding: EdgeInsetsGeometry.symmetric(
            horizontal: 12,
            // vertical: 0,
          ),
        ),
      ),
    );
  }
}
