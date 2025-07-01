import 'package:flutter/widgets.dart';

class ImageItem extends StatelessWidget {
  final String name;
  final String type;
  final double? width;
  final double? height;
  final BoxFit fit;

  const ImageItem({
    super.key,
    required this.name,
    this.type = 'png',
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$name.$type',
      width: width,
      height: height,
      fit: fit,
    );
  }
}
