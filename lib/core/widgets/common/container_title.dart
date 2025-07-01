import 'package:flutter/material.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';

class ContainerTitle extends StatelessWidget {
  final Widget child;
  final String? title;
  const ContainerTitle({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextDefault(
              label: "$title",
              fontSize: 18,
              weight: FontWeight.w800,
            ),
          ],
        ),
        child,
      ],
    );
  }
}
