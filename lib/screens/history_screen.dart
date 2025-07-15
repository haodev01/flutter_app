import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';
import 'package:workspace/core/widgets/common/text/app_text_default.dart';
import 'package:workspace/core/widgets/common/text/app_text_small.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DateTime selectedDate = DateTime.now();

  void showDatePicker() {
    DateTime tempPickedDate = selectedDate;

    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            // Buttons row
            Container(
              decoration: BoxDecoration(color: AppColors.white),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: AppTextDefault(
                      label: 'Hủy',
                      color: AppColors.primary,
                      weight: FontWeight.w700,
                    ),

                    onTap: () => Navigator.of(context).pop(),
                  ),
                  GestureDetector(
                    child: AppTextDefault(
                      label: 'Xong',
                      color: AppColors.primary,
                      weight: FontWeight.w700,
                    ),
                    onTap: () {
                      setState(() => selectedDate = tempPickedDate);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ), // Date picker
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                minimumDate: DateTime(2000),
                maximumDate: DateTime(2100),
                onDateTimeChanged: (DateTime value) {
                  tempPickedDate = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: AppTextDefault(
          label: 'Lịch sử giao dịch',
          fontSize: 18,
          weight: FontWeight.w800,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const ImageItem(name: 'icon-arrow-left', width: 24, height: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                children: [
                  TextField(
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.title1,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm từ khóa',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: AppColors.title2,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: ImageItem(
                          name: 'icon-search',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        right: 16,
                        left: 0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        // borderSide: BorderSide(color: AppColors.title1),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        // borderSide: BorderSide(color: AppColors.title1),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        // borderSide: BorderSide(color: AppColors.title1),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 16,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: showDatePicker,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              color: AppColors.white,
                            ),
                            child: Row(
                              spacing: 16,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextSmall(
                                      label: 'Từ ngày',
                                      color: AppColors.title2,
                                    ),
                                    AppTextDefault(
                                      label: formattedDate,
                                      weight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                ImageItem(
                                  name: 'icon-calendar',
                                  width: 24,
                                  height: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: AppColors.white,
                          ),
                          child: Row(
                            spacing: 16,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextSmall(
                                    label: 'Từ ngày',
                                    color: AppColors.title2,
                                  ),
                                  AppTextDefault(
                                    label: '31/07/2024',
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              ImageItem(
                                name: 'icon-calendar',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
