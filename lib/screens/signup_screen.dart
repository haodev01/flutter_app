import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/button/button_primary.dart';
import 'package:workspace/core/widgets/common/dialog/main_dialog.dart';
import 'package:workspace/core/widgets/input/animated_textfield.dart';
import 'package:workspace/core/widgets/text/app_text_description.dart';
import 'package:workspace/core/widgets/text/app_text_title.dart';
import 'package:workspace/extensions/validators.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String errorPhone = '';
  String errorPassword = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 👉 bỏ focus tất cả TextField
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              true, // 👈 tự động hiện icon back nếu có Navigator
          title: null, // 👈 không cần title
          elevation: 0, // 👈 nếu muốn bỏ bóng
          backgroundColor: AppColors.background, // 👈 hoặc màu nền bạn muốn
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // căn trái theo chiều ngang
                children: [
                  AppTextTitle(label: "Đăng ký tài khoản"),
                  AppTextDescription(
                    label: "Vui lòng nhập thông tin để đăng ký",
                  ),
                  SizedBox(height: 32),
                  AnimatedTextField(
                    label: "Số điện thoại",
                    suffix: null,
                    controller: phoneController,
                    errorMessage: errorPhone,
                    isKeyboardNumber: true,
                    validator: (value) {
                      setState(() {
                        errorPhone = value?.validatePhone ?? '';
                      });
                      return;
                    },
                  ),
                  SizedBox(height: 16),
                  AnimatedTextField(
                    label: "Mật khẩu",
                    suffix: null,
                    controller: passwordController,
                    errorMessage: errorPassword,
                    validator: (value) {
                      setState(() {
                        errorPassword = value?.validatePassword ?? '';
                      });
                      return;
                    },
                  ),
                  SizedBox(height: 20),
                  ButtonPrimary(
                    label: "Đăng nhập",
                    onPressed: () {
                      _formKey.currentState!.validate();
                      if (errorPhone.trim().isEmpty &&
                          errorPassword.trim().isEmpty) {
                        showMainDialog(
                          context: context,
                          title: 'Thông tin đăng nhập không hợp lệ',
                          description: 'Bạn vui lòng kiểm tra lại',
                          textButton: 'Đã hiểu',
                          imageName: "image-failed.png",
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
