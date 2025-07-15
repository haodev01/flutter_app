import 'package:flutter/material.dart';
import 'package:workspace/core/constants/list_constants.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';
import 'package:workspace/core/widgets/home/icon_label.dart';
import 'package:go_router/go_router.dart';

class FavoriteFunction extends StatefulWidget {
  const FavoriteFunction({super.key});

  @override
  State<FavoriteFunction> createState() => _FavoriteFunctionState();
}

class _FavoriteFunctionState extends State<FavoriteFunction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextDefault(
                label: 'Chức năng ưa thích',
                fontSize: 18,
                weight: FontWeight.w800,
              ),
              AppTextDefault(
                label: 'Tùy chỉnh',
                fontSize: 14,
                weight: FontWeight.w900,
              ),
            ],
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            childAspectRatio: 83 / 88,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(favorites.length, (index) {
              return GestureDetector(
                onTap: () {
                  if (favorites[index]['route'] != null &&
                      favorites[index]['route'].toString().isNotEmpty) {
                    GoRouter.of(
                      context,
                    ).push(favorites[index]['route'].toString());
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: IconLabel(
                    icon: favorites[index]['icon'],
                    label: favorites[index]['label'],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
