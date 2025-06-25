import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/button/button_primary.dart';
import 'package:workspace/core/widgets/input/animated_textfield.dart';
import 'package:workspace/core/widgets/text/app_text_description.dart';
import 'package:workspace/core/widgets/text/app_text_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 16, top: 32, right: 16),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // căn trái theo chiều ngang
              children: [
                AppTextTitle(label: "Đăng nhập tài khoản"),
                AppTextDescription(
                  label: "Vui lòng nhập thông tin để tiếp tục",
                ),
                SizedBox(height: 32),
                AnimatedTextField(label: "Số điện thoại", suffix: null),
                SizedBox(height: 16),
                AnimatedTextField(label: "Mật khẩu", suffix: null),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () => {},
                  child: Text(
                    "Quên mật khẩu",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ButtonPrimary(label: "Đăng nhập"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
