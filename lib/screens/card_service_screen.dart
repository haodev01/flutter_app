import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:workspace/core/constants/list_constants.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/button/button_primary.dart';
import 'package:workspace/core/widgets/common/container_title.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/common/item/info_item.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CardServiceScreen extends StatefulWidget {
  const CardServiceScreen({super.key});

  @override
  State<CardServiceScreen> createState() => _CardServiceScreenState();
}

class _CardServiceScreenState extends State<CardServiceScreen> {
  int selectedAddress = 0;

  final List<Map<String, dynamic>> addresses = [
    {
      'title': 'Địa chỉ công tác/trường học',
      'subtitle': '98 Hoàng Quốc Việt, Nghĩa Đô, Cầu Giấy, Hà Nội',
    },
    {'title': 'Địa chỉ thường trú', 'subtitle': 'Địa chỉ thường trú'},
    {'title': 'Địa chỉ tạm trú', 'subtitle': 'Địa chỉ tạm trú'},
    {'title': 'Địa chỉ khác'},
  ];

  String? selectedValue; // giá trị được chọn
  List<String> items = ['Apple', 'Banana', 'Orange', 'Grapes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: AppTextDefault(
          label: 'Yêu cầu phát hành thẻ vật lý',
          fontSize: 18,
          weight: FontWeight.w800,
        ),
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: IconButton(
          icon: const ImageItem(name: 'icon-arrow-left', width: 24, height: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(color: AppColors.white),
        child: ButtonPrimary(label: 'Phát hành thẻ'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // 👉 bỏ focus tất cả TextField
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ContainerTitle(
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
                  SizedBox(height: 26),
                  ContainerTitle(
                    title: 'Chọn địa chỉ nhận thẻ',
                    child: Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Column(
                        children: List.generate(addresses.length, (index) {
                          final address = addresses[index];
                          final isFirst = index == 0;
                          final isLast = index == addresses.length - 1;
                          return ClipRRect(
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
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                border: RDottedLineBorder(
                                  bottom: BorderSide(
                                    color: isLast
                                        ? Colors.transparent
                                        : AppColors.title2,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ImageItem(
                                    name: 'icon-location',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  if (address['subtitle'] != null)
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AppTextDefault(
                                                  label: address['title'],
                                                ),
                                                SizedBox(height: 4),
                                                if (selectedAddress == index)
                                                  AppTextDefault(
                                                    label: address['subtitle'],
                                                    fontSize: 18,
                                                    weight: FontWeight.w600,
                                                  ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedAddress = index;
                                              });
                                            },
                                            child: ImageItem(
                                              name: selectedAddress == index
                                                  ? 'icon-radio-active'
                                                  : 'icon-radio',
                                              width: 24,
                                              height: 24,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  else
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 14,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: AppTextDefault(
                                                  label: address['title'],
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedAddress = index;
                                                  });
                                                },
                                                child: ImageItem(
                                                  name: selectedAddress == index
                                                      ? 'icon-radio-active'
                                                      : 'icon-radio',
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (selectedAddress == index)
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton2<String>(
                                                isExpanded: true,
                                                hint: AppTextDefault(
                                                  label: 'Chọn Thành phố/Tỉnh',
                                                  fontSize: 16,
                                                  color: AppColors.title2,
                                                  weight: FontWeight.w600,
                                                ),
                                                items: items
                                                    .map(
                                                      (item) =>
                                                          DropdownMenuItem<
                                                            String
                                                          >(
                                                            value: item,
                                                            child: AppTextDefault(
                                                              label: item,
                                                              fontSize: 14,
                                                              color: AppColors
                                                                  .title1,
                                                              weight: FontWeight
                                                                  .w600,
                                                            ),
                                                          ),
                                                    )
                                                    .toList(),
                                                value: selectedValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedValue = value;
                                                  });
                                                },
                                                buttonStyleData: ButtonStyleData(
                                                  height: 48,
                                                  padding:
                                                      const EdgeInsets.only(
                                                        right: 12,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                    border: Border.all(
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                  ),
                                                ),
                                                iconStyleData: const IconStyleData(
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                  ),
                                                  iconSize: 24,
                                                  iconEnabledColor:
                                                      Colors.black54,
                                                ),
                                                dropdownStyleData:
                                                    DropdownStyleData(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                      ),
                                                    ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
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
