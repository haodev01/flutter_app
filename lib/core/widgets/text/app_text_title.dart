import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';

class AppTextTitle extends StatelessWidget {
  final String label;

  const AppTextTitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: AppColors.title1,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
