import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';

class AppTextSmall extends StatelessWidget {
  final String label;
  final bool textCenter;
  final Color color;
  final double fontSize;
  final FontWeight weight;

  const AppTextSmall({
    super.key,
    required this.label,
    this.textCenter = false,
    this.color = AppColors.title1,
    this.fontSize = 12,
    this.weight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: color, fontSize: fontSize, fontWeight: weight),
      textAlign: textCenter ? TextAlign.center : TextAlign.left,
    );
  }
}
