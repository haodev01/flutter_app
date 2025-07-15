import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';

class AppTextDefault extends StatelessWidget {
  final String label;
  final Color color;
  final FontWeight weight;
  final double fontSize;
  final bool textCenter;
  final bool textRight;

  const AppTextDefault({
    super.key,
    required this.label,
    this.color = AppColors.title1,
    this.weight = FontWeight.w400,
    this.fontSize = 16,
    this.textCenter = false,
    this.textRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: weight,
        decoration: TextDecoration.none,
      ),
      textAlign: textCenter
          ? TextAlign.center
          : textRight
          ? TextAlign.right
          : TextAlign.left,
    );
  }
}
