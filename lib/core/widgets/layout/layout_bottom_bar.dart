import 'package:flutter/material.dart';
import 'package:workspace/core/widgets/common/bottom-bar/nav_bar.dart';
import 'package:workspace/core/widgets/common/bottom-bar/nav_model.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/popup/quick_access_popup.dart';

class LayoutBottomBar extends StatefulWidget {
  final List<NavModel> items;

  const LayoutBottomBar({super.key, required this.items});

  @override
  State<LayoutBottomBar> createState() => _LayoutBottomBarState();
}

class _LayoutBottomBarState extends State<LayoutBottomBar> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (widget.items[selectedTab].navKey.currentState?.canPop() ?? false) {
          widget.items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: selectedTab,
          children: widget.items
              .map(
                (page) => Navigator(
                  key: page.navKey,
                  onGenerateInitialRoutes: (navigator, initialRoute) {
                    return [MaterialPageRoute(builder: (context) => page.page)];
                  },
                ),
              )
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 32),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 36,
                left: -33,
                child: ImageItem(name: 'image-topbg', width: 120, height: 30),
              ),
              GestureDetector(
                onTap: () {
                  showQuickAccessPopup(context, 'Truy cập nhanh');
                },
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Center(
                    child: ImageItem(
                      name: 'icon-vector',
                      width: 22,
                      height: 20,
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   top: 10,
              //   left: 32,
              //   child: GestureDetector(
              //     onTap: () {
              //       showQuickAccessPopup(context, 'Truy cập nhanh');
              //     },
              //     child: Container(
              //       width: 54,
              //       height: 54,
              //       decoration: BoxDecoration(
              //         color: AppColors.primary,
              //         borderRadius: BorderRadius.circular(999),
              //       ),
              //       child: Center(
              //         child: ImageItem(
              //           name: 'icon-vector',
              //           width: 22,
              //           height: 20,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              widget.items[index].navKey.currentState?.popUntil(
                (route) => route.isFirst,
              );
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}
