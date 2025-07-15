import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';

class SectionItem extends StatefulWidget {
  final String? sufIcon;
  final String? preIcon;
  final String label;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback? onPressed;
  final RDottedLineBorder? border;
  final int? index;

  const SectionItem({
    super.key,
    this.sufIcon,
    this.preIcon,
    required this.label,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.onPressed,
    this.border,
    this.index,
  });

  @override
  State<SectionItem> createState() => _SectionItemState();
}

class _SectionItemState extends State<SectionItem> {
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
          children: [
            ImageItem(name: "${widget.preIcon}", width: 24, height: 24),
            SizedBox(width: 14),
            Expanded(
              child: AppTextDefault(
                label: widget.label,
                weight: FontWeight.w500,
              ),
            ),
            if (widget.index != 0)
              GestureDetector(
                onTap: widget.onPressed,
                child: ImageItem(
                  name: "${widget.sufIcon}",
                  width: 24,
                  height: 24,
                ),
              ),
            if (widget.index == 0)
              Transform.scale(
                scale: 0.7, // nhỏ hơn cả chiều cao và chiều ngang
                child: CupertinoSwitch(
                  value: isEnabled,
                  activeTrackColor: AppColors.primary,
                  onChanged: (value) => setState(() => isEnabled = value),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
