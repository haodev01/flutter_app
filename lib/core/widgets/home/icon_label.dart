import 'package:flutter/material.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';

class IconLabel extends StatefulWidget {
  final String icon;
  final String label;
  const IconLabel({super.key, required this.icon, this.label = ''});

  @override
  State<IconLabel> createState() => _IconLabelState();
}

class _IconLabelState extends State<IconLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ImageItem(name: widget.icon, width: 32, height: 32),
          SizedBox(height: 4),
          AppTextDefault(
            label: widget.label,
            fontSize: 13,
            weight: FontWeight.w500,
            textCenter: true,
          ),
        ],
      ),
    );
  }
}
