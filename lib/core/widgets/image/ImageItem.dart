import 'package:flutter/widgets.dart';

class ImageItem extends StatelessWidget {
  final String name;
  final String type;
  final double width;
  final double height;
  const ImageItem({
    super.key,
    required this.name,
    this.type = 'png',
    this.width = 54,
    this.height = 54,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$name.$type',
      width: width,
      height: height,

      fit: BoxFit.cover,
    );
  }
}
