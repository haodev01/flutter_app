import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/text/app_text_button.dart';

class ButtonPrimary extends StatelessWidget {
  final double? width;
  final VoidCallback? onPressed;
  final String label;

  const ButtonPrimary({
    super.key,
    this.width,
    required this.label,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),

      child: SizedBox(
        width: width ?? double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: AppTextButton(label: label),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
