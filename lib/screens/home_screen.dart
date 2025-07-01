import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/common/bottom-bar/nav_model.dart';
import 'package:workspace/core/widgets/home/favorite_function.dart';
import 'package:workspace/core/widgets/home/interested.dart';
import 'package:workspace/core/widgets/home/orther_util.dart';
import 'package:workspace/core/widgets/home/payment_info.dart';
import 'package:workspace/core/widgets/home/user_info.dart';
import 'package:workspace/core/widgets/layout/layout_bottom_bar.dart';
import 'package:workspace/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBottomBar(
      items: [
        NavModel(page: HomePage(), navKey: GlobalKey<NavigatorState>()),
        NavModel(page: ProfileScreen(), navKey: GlobalKey<NavigatorState>()),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  OrtherUtil(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
