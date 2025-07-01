import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';

class AppTextTitle extends StatelessWidget {
  final String label;
  final bool textCenter;
  final Color color;

  const AppTextTitle({
    super.key,
    required this.label,
    this.textCenter = false,
    this.color = AppColors.title1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: color, fontSize: 28, fontWeight: FontWeight.w700),
      textAlign: textCenter ? TextAlign.center : TextAlign.left,
    );
  }
}
