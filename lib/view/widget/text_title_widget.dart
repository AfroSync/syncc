import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String title;

  const TextTitleWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
    );
  }
}
