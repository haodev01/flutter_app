import 'package:flutter/material.dart';
import 'package:workspace/core/constants/list_constants.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';
import 'package:workspace/core/widgets/common/text/app_text_small.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({super.key});

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    padding: EdgeInsets.only(bottom: 4), // space for underline
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextSmall(
                          label: tabs[index]['label'],
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.title2,
                          fontSize: 14,
                          weight: FontWeight.w900,
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 2,
                          width: 24,
                          color: isSelected
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Stack(
            children: [
              ImageItem(
                name: 'bg-card',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                top: 12,
                right: 12,
                child: ImageItem(
                  name: 'logo-vc',
                  width: 104,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: ImageItem(
                  name: 'image-isolation',
                  width: 104,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: 24,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextDefault(
                      label: '9740 60** **** 1234',
                      fontSize: 22,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(height: 14),
                    Row(
                      spacing: 16,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextSmall(
                              label: 'Số tài khoản',
                              weight: FontWeight.w600,
                            ),
                            AppTextDefault(
                              label: '12345678',
                              weight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextSmall(
                              label: 'Hiệu lực đến',
                              weight: FontWeight.w600,
                            ),
                            AppTextDefault(
                              label: '12/16',
                              weight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    AppTextDefault(
                      label: 'HARRY TRAN',
                      fontSize: 18,
                      weight: FontWeight.w900,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
