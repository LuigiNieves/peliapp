// lib/widgets/netflix_title.dart

import 'package:flutter/material.dart';

class APPTitle extends StatelessWidget {
  final String text;
  final double fontSize;

  const APPTitle({
    super.key,
    required this.text,
    this.fontSize = 36,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.redAccent,
        fontWeight: FontWeight.w900,
        letterSpacing: 3,
        shadows: [
          Shadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
