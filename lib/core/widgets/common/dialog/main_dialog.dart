import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/button/button_primary.dart';
import 'package:workspace/core/widgets/text/app_text_sub.dart';
import 'package:workspace/core/widgets/text/app_text_title.dart';

enum PopupType { success, error }

void showMainDialog({
  required BuildContext context,
  required String title,
  required String description,
  String? imageName,
  String textButton = 'OK',
  PopupType type = PopupType.success,
  VoidCallback? onPressed,
}) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      insetPadding: EdgeInsets.all(10),
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Image.asset(
                'assets/images/$imageName',
                width: 54,
                height: 54,
                fit: BoxFit.cover,
              ),
              AppTextTitle(label: title, textCenter: true),
              AppTextSub(label: description),
              ButtonPrimary(
                label: textButton,
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressed?.call();
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
