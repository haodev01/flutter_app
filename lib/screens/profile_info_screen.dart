import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:workspace/core/constants/list_constants.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/container_title.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/common/item/info_item.dart';
import 'package:workspace/core/widgets/common/item/section_item.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  File? imageFile;

  @override
  void initState() {
    super.initState();
    loadAvatar();
  }

  Future<void> loadAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    final avatar = prefs.getString('avatar') ?? '';
    if (avatar.isNotEmpty) {
      setState(() {
        imageFile = File(avatar);
      });
    }
  }

  Future<void> pickImage() async {
    final status = await Permission.photos.request();

    if (status.isGranted) {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('avatar');
        await prefs.setString('avatar', pickedFile.path);
      }
    } else if (status.isDenied) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Bạn cần cấp quyền truy cập ảnh')));
    } else if (status.isPermanentlyDenied) {
      openAppSettings(); // Mở cài đặt để người dùng cấp quyền thủ công
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: AppTextDefault(
          label: 'Thông tin cá nhân',
          fontSize: 18,
          weight: FontWeight.w800,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const ImageItem(name: 'icon-arrow-left', width: 24, height: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: imageFile == null
                            ? ImageItem(
                                name: 'avatar-default',
                                width: 96,
                                height: 96,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                imageFile!,
                                width: 96,
                                height: 96,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ImageItem(
                              name: 'icon-camera',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  AppTextDefault(
                    label: 'Harry Tran',
                    fontSize: 22,
                    weight: FontWeight.w800,
                  ),
                ],
              ),
              SizedBox(height: 32),
              ContainerTitle(
                title: 'Thông tin chung',
                child: Container(
                  margin: EdgeInsets.only(top: 14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(profileInfo.length, (index) {
                      final isFirst = index == 0;
                      final isLast = index == profileInfo.length - 1;
                      return InfoItem(
                        label: profileInfo[index]['label'],
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppTextDefault(
                              label: profileInfo[index]['value'],
                              weight: FontWeight.w900,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 26),
              ContainerTitle(
                title: 'Thông tin chung',
                child: Container(
                  margin: EdgeInsets.only(top: 14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(profileContact.length, (index) {
                      final isFirst = index == 0;
                      final isLast = index == profileContact.length - 1;
                      return InfoItem(
                        label: profileContact[index]['label'],
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Expanded(
                              child: AppTextDefault(
                                label: profileContact[index]['value'],
                                weight: FontWeight.w900,
                                textRight: true,
                              ),
                            ),
                            if (profileContact[index]['edit']?.toLowerCase() ==
                                'true')
                              ImageItem(
                                name: 'icon-edit',
                                width: 24,
                                height: 24,
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 26),
              ContainerTitle(
                title: 'Webview',
                child: Container(
                  margin: EdgeInsets.only(top: 14),
                  child: SectionItem(
                    label: 'Test webview',
                    sufIcon: 'icon-arrow-right-dis',
                    preIcon: 'icon-profile',
                    onPressed: () {
                      GoRouter.of(context).push(
                        '/webview?url=${Uri.encodeComponent('https://tinvay.com.vn/')}',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
