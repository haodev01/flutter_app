import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/text/app_text_error.dart';

class AnimatedTextField extends StatefulWidget {
  final String label;
  final Widget? suffix;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? errorMessage;
  final bool isKeyboardNumber;

  const AnimatedTextField({
    Key? key,
    required this.label,
    required this.suffix,
    this.validator,
    required this.controller,
    this.errorMessage,
    this.isKeyboardNumber = false,
  }) : super(key: key);

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: _isFocused ? AppColors.primary : AppColors.background,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: TextFormField(
            focusNode: _focusNode,
            validator: widget.validator,
            controller: widget.controller,
            keyboardType: widget.isKeyboardNumber
                ? TextInputType.number
                : TextInputType.text,
            decoration: InputDecoration(
              label: Text(
                widget.label,
                style: TextStyle(
                  color: _isFocused ? AppColors.labelFocus : AppColors.title2,
                  fontSize: 18,
                ),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              suffixIcon: widget.suffix,
            ),
          ),
        ),
        if (widget.errorMessage!.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 6),
            child: AppTextError(label: widget.errorMessage ?? ''),
          ),
      ],
    );
  }
}
