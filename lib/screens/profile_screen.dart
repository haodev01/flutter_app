import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:workspace/core/constants/list_constants.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/container_title.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/common/item/section_item.dart';
import 'package:workspace/core/widgets/profile/user_info.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            ImageItem(
              name: 'bg-home',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            SafeArea(
              child: Column(
                children: [
                  UserInfo(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 16),
                        ContainerTitle(
                          title: 'Thông tin chung',
                          child: Container(
                            margin: EdgeInsets.only(top: 14),
                            child: SectionItem(
                              label: 'Thông tin tài khoản',
                              sufIcon: 'icon-arrow-right-dis',
                              preIcon: 'icon-profile',
                              onPressed: () {
                                GoRouter.of(context).push('/profile-info');
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        ContainerTitle(
                          title: 'Cài đặt chung',
                          child: Container(
                            margin: EdgeInsets.only(top: 14),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(settings.length, (index) {
                                final isFirst = index == 0;
                                final isLast = index == settings.length - 1;
                                return SectionItem(
                                  index: index,
                                  label: settings[index]['label'],
                                  preIcon: settings[index]['preIcon'],
                                  sufIcon: 'icon-arrow-right-dis',
                                  border: RDottedLineBorder(
                                    bottom: BorderSide(
                                      color: isLast
                                          ? Colors.transparent
                                          : AppColors.title2,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: isFirst
                                        ? Radius.circular(16)
                                        : Radius.circular(0),
                                    topRight: isFirst
                                        ? Radius.circular(16)
                                        : Radius.circular(0),
                                    bottomLeft: isLast
                                        ? Radius.circular(16)
                                        : Radius.circular(0),
                                    bottomRight: isLast
                                        ? Radius.circular(16)
                                        : Radius.circular(0),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        ContainerTitle(
                          title: 'Hỗ trợ',
                          child: Container(
                            margin: EdgeInsets.only(top: 14),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(supports.length, (index) {
                                final isFirst = index == 0;
                                final isLast = index == supports.length - 1;
                                return SectionItem(
                                  label: supports[index]['label'],
                                  preIcon: supports[index]['preIcon'],
                                  sufIcon: 'icon-arrow-right-dis',
                                  border: RDottedLineBorder(
                                    bottom: BorderSide(
                                      color: isLast
                                          ? Colors.transparent
                                          : AppColors.title2,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: isFirst
                                        ? Radius.circular(16)
                                        : Radius.circular(0),
                                    topRight: isFirst
                                        ? Radius.circular(16)
                                        : Radius.circular(0),
                                    bottomLeft: isLast
                                        ? Radius.circular(16)
                                        : Radius.circular(0),
                                    bottomRight: isLast
                                        ? Radius.circular(16)
                                        : Radius.circular(0),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
