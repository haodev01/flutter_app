import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';

class AppTextDescription extends StatelessWidget {
  final String label;

  const AppTextDescription({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: AppColors.title2,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
