import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';

class AppTextError extends StatelessWidget {
  final String label;

  const AppTextError({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: AppColors.primary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
