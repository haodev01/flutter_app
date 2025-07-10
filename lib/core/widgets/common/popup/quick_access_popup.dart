import 'package:flutter/material.dart';
import 'package:workspace/core/constants/list_constants.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';
import 'package:workspace/core/widgets/home/icon_label.dart';

void showQuickAccessPopup(BuildContext context, label) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextDefault(
                  label: label,
                  fontSize: 22,
                  weight: FontWeight.w900,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ImageItem(
                    name: 'icon-close-circle',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Grid of actions
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              childAspectRatio: 83 / 88,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(quickAccess.length, (index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: IconLabel(
                      icon: quickAccess[index]['icon'],
                      label: quickAccess[index]['label'],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      );
    },
  );
}
