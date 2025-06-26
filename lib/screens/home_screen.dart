import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 👉 bỏ focus tất cả TextField
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Text('Home screen'),
          ),
        ),
      ),
    );
  }
}
