import 'package:flutter/material.dart';
import 'package:workspace/core/widgets/common/container_title.dart';
import 'package:workspace/core/widgets/home/interested_slider.dart';

class Interested extends StatefulWidget {
  const Interested({super.key});

  @override
  State<Interested> createState() => _InterestedState();
}

class _InterestedState extends State<Interested> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ContainerTitle(
        title: 'Có thể bạn quan tâm',
        child: Container(
          margin: EdgeInsets.only(top: 12),
          child: InterestedSlider(),
        ),
      ),
    );
  }
}
