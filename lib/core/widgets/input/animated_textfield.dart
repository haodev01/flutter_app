import 'package:flutter/material.dart';
import 'package:workspace/core/theme/app_colors.dart';
import 'package:workspace/core/widgets/image/ImageItem.dart';
import 'package:workspace/core/widgets/text/app_text_error.dart';

class AnimatedTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? errorMessage;
  final bool isKeyboardNumber;
  final bool isPw;

  const AnimatedTextField({
    Key? key,
    required this.label,
    this.validator,
    required this.controller,
    this.errorMessage,
    this.isKeyboardNumber = false,
    this.isPw = false,
  }) : super(key: key);

  @override
  State<AnimatedTextField> createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool showPw = false;

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
            obscureText: widget.isPw && !showPw,
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
              suffixIcon: widget.isPw
                  ? IconButton(
                      icon: ImageItem(
                        name: showPw ? 'icon-eye' : 'icon-eye-close',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        setState(() {
                          showPw = !showPw;
                        });
                      },
                    )
                  : null,
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
