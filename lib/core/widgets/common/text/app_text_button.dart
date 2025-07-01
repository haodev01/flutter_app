import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final String label;

  const AppTextButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
