import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 22),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: Container(
          height: 64,
          color: AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem('icon-home', pageIndex == 0, onTap: () => onTap(0)),

              const SizedBox(width: 0),

              navItem('icon-profile', pageIndex == 1, onTap: () => onTap(1)),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(String icon, bool selected, {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: ImageItem(
        name: selected ? "$icon-active" : icon,
        width: 30,
        height: 30,
      ),
    );
  }
}
