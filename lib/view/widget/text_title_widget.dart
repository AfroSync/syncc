import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String title;
  final bool horizontalPadding;
  final bool verticalPadding;

  const TextTitleWidget(
    this.title, {
    super.key,
    this.horizontalPadding = true,
    this.verticalPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: horizontalPadding ? 16 : 0,
        left: horizontalPadding ? 16 : 0,
        top: verticalPadding ? 16 : 0,
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
    );
  }
}
