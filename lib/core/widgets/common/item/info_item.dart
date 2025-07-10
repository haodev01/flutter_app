import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';

class InfoItem extends StatefulWidget {
  final String label;
  final BorderRadiusGeometry borderRadius;
  final RDottedLineBorder? border;
  final Widget child;

  const InfoItem({
    super.key,
    required this.label,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.border,
    required this.child,
  });

  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: widget.border,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 80),
              child: AppTextDefault(
                label: widget.label,
                weight: FontWeight.w500,
                color: AppColors.title2,
              ),
            ),
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }
}
