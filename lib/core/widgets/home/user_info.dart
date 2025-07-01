import 'package:flutter/widgets.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';
import 'package:workspace/core/widgets/common/text/app_text_small.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            children: [
              ImageItem(name: 'icon-user', width: 36, height: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextSmall(label: 'Xin chào', color: AppColors.white),
                  AppTextDefault(
                    label: 'Harry Tran',
                    color: AppColors.white,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          ImageItem(name: 'icon-bell', width: 24, height: 24),
        ],
      ),
    );
  }
}
