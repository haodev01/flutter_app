import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';

class AnimatedTextField extends StatefulWidget {
  final String label;
  final Widget? suffix;
  const AnimatedTextField({Key? key, required this.label, required this.suffix})
    : super(key: key);

  @override
  State<AnimatedTextField> createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: _isFocused ? AppColors.primary : AppColors.background,
          width: 1.5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: TextField(
        focusNode: _focusNode,
        decoration: InputDecoration(
          label: Text(
            widget.label,
            style: TextStyle(
              color: _isFocused ? AppColors.labelFocus : AppColors.title2,
              fontSize: 16,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          suffixIcon: widget.suffix,
        ),
      ),
    );
  }
}
