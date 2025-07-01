import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';

class AppTextDescription extends StatelessWidget {
  final String label;
  final Color color;

  const AppTextDescription({
    super.key,
    required this.label,
    this.color = AppColors.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}
