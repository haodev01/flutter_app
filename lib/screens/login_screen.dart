import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/button/button_primary.dart';
import 'package:workspace/core/widgets/common/input/animated_textfield.dart';
import 'package:workspace/core/widgets/common/text/app_text_description.dart';
import 'package:workspace/core/widgets/common/text/app_text_title.dart';
import 'package:workspace/extensions/validators.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;
  final passwordController = TextEditingController();

  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController(); // khởi tạo ban đầu
    _loadEmail();
  }

  Future<void> _loadEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final phoneNumber = prefs.getString('phoneNumber') ?? '';
    phoneController.text = phoneNumber; // gán giá trị từ SharedPreferences
  }

  final _formKey = GlobalKey<FormState>();

  String errorPhone = '';
  String errorPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading:
            true, // 👈 tự động hiện icon back nếu có Navigator
        title: null, // 👈 không cần title
        elevation: 0, // 👈 nếu muốn bỏ bóng
        backgroundColor: Colors.transparent, // 👈 hoặc màu nền bạn muốn
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: AppColors.background,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // 👉 bỏ focus tất cả TextField
        },
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // căn trái theo chiều ngang
                children: [
                  AppTextTitle(label: "Đăng nhập tài khoản"),
                  AppTextDescription(
                    label: "Vui lòng nhập thông tin để tiếp tục",
                  ),
                  SizedBox(height: 32),
                  AnimatedTextField(
                    label: "Số điện thoại",
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
                    controller: passwordController,
                    errorMessage: errorPassword,
                    isPw: true,
                    validator: (value) {
                      setState(() {
                        errorPassword = value?.validatePassword ?? '';
                      });
                      return;
                    },
                  ),
                  SizedBox(height: 16),

                  TextButton(
                    onPressed: () => {},
                    child: Text(
                      "Quên mật khẩu",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ButtonPrimary(
                    label: "Đăng nhập",
                    onPressed: () async {
                      _formKey.currentState!.validate();
                      if (errorPhone.trim().isEmpty &&
                          errorPassword.trim().isEmpty) {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('phoneNumber');
                        await prefs.setString(
                          'phoneNumber',
                          phoneController.text,
                        );
                        GoRouter.of(context).push('/');
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                    ),
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
