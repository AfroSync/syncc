import 'package:flutter/material.dart';

class ModernPhoneInputField extends StatefulWidget {
  const ModernPhoneInputField({super.key});

  @override
  State<ModernPhoneInputField> createState() => _ModernPhoneInputFieldState();
}

class _ModernPhoneInputFieldState extends State<ModernPhoneInputField> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [Expanded(child: ModernPhoneInputField())]);
  }
}
