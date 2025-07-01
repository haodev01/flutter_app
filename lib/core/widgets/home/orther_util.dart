import 'package:flutter/material.dart';
import 'package:workspace/core/constants/list_constants.dart';
import 'package:workspace/core/widgets/common/container_title.dart';
import 'package:workspace/core/widgets/home/icon_label.dart';

class OrtherUtil extends StatefulWidget {
  const OrtherUtil({super.key});

  @override
  State<OrtherUtil> createState() => _OrtherUtilState();
}

class _OrtherUtilState extends State<OrtherUtil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ContainerTitle(
        title: 'Tiện ích khác',
        child: Container(
          margin: EdgeInsets.only(top: 12),
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: 114 / 88,
            children: List.generate(ortherUtil.length, (index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: IconLabel(
                    icon: ortherUtil[index]['icon'],
                    label: ortherUtil[index]['label'],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
