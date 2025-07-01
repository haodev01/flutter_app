import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/home/favorite_function.dart';
import 'package:workspace/core/widgets/home/interested.dart';
import 'package:workspace/core/widgets/home/payment_info.dart';
import 'package:workspace/core/widgets/home/user_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
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
                  PaymentInfo(),
                  FavoriteFunction(),
                  Interested(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
