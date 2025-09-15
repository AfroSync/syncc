import 'package:flutter/material.dart';
import 'package:syncc/model/enums/music_genre.dart';

import '../../core/color.dart';

class ModernGenrePicker extends StatefulWidget {
  final String title;
  final Function(List<MusicGenre> genre)? onChanged;

  const ModernGenrePicker({
    super.key,
    this.title = "Artist Genres (max. 3)",
    required this.onChanged,
  });

  @override
  State<ModernGenrePicker> createState() => _ModernGenrePickerState();
}

class _ModernGenrePickerState extends State<ModernGenrePicker> {
  List<MusicGenre> selectedGenres = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(),
        Text(
          widget.title,
          style: TextStyle(
            color: ModernColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 0.5,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: MusicGenre.values
              .map(
                (genre) => ModernChip(
                  genre.displayName,
                  onChanged: (value) {
                    setState(() {
                      if (value) {
                        selectedGenres.add(genre);
                      } else {
                        selectedGenres.remove(genre);
                      }
                    });
                  },
                  canSelect: selectedGenres.length < 3,
                ),
              )
              .toList(),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}

class ModernChip extends StatefulWidget {
  const ModernChip(
    this.text, {
    super.key,
    this.onChanged,
    this.canSelect = true,
  });

  final bool canSelect;
  final String text;
  final Function(bool)? onChanged;

  @override
  State<ModernChip> createState() => _ModernChipState();
}

class _ModernChipState extends State<ModernChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!widget.canSelect && !isSelected) return;
        setState(() {
          isSelected = !isSelected;
        });
        widget.onChanged?.call(isSelected);
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: ModernColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? ModernColors.primary
                : ModernColors.textSecondary,
          ),
        ),
        padding: EdgeInsetsGeometry.symmetric(vertical: 4, horizontal: 12),
        child: AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInCubic,
          clipBehavior: Clip.none,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSelected) ...[
                Icon(Icons.check, color: ModernColors.primary, size: 20),
                SizedBox(width: 4),
              ],

              Text(
                widget.text,
                style: TextStyle(
                  color: isSelected
                      ? ModernColors.text
                      : ModernColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
