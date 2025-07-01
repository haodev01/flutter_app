import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/common/image/image_item.dart';

class InterestedSlider extends StatefulWidget {
  const InterestedSlider({super.key});

  @override
  State<InterestedSlider> createState() => _InterestedSliderState();
}

class _InterestedSliderState extends State<InterestedSlider> {
  int active = 0;

  final List<String> imgList = ['slider/1', 'slider/2', 'slider/3'];
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 130,
            autoPlay: true,
            enableInfiniteScroll: true,
            viewportFraction: 1.0,
            autoPlayInterval: Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                active = index;
              });
            },
          ),
          items: imgList.map((imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    // decoration: BoxDecoration(color: Colors.amber),
                    child: ImageItem(
                      name: imagePath,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: active == entry.key ? 8.0 : 8.0,
                  height: active == entry.key ? 8.0 : 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: active == entry.key
                        ? AppColors.white
                        : Colors.transparent.withValues(alpha: 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
