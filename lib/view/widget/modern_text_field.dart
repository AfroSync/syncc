import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/color.dart';

class ModernTextField extends StatelessWidget {
  final String title;
  final Function(String text)? onChanged;
  final String value;
  final TextAlign align;
  final bool autofocus;
  final TextInputType? keyboardType;
  final bool shouldObscure;

  const ModernTextField(
    this.title, {
    super.key,
    this.onChanged,
    this.keyboardType,
    this.autofocus = false,
    this.align = TextAlign.start,
    this.value = "",
    this.shouldObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ModernColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 0.5,
          ),
        ),
        TextField(
          onChanged: onChanged,
          obscureText: shouldObscure,
          keyboardType: TextInputType.phone,
          controller: TextEditingController(text: value),
          autofocus: autofocus,
          textAlign: align,
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
