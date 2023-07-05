import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors/colors.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.maxLines,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.height = 0,
    this.width = 0,
    this.isFilled = false,
    this.obscureText = false,
  });

  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double height;
  final double width;
  final bool isFilled;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height == 0 ? MediaQuery.of(context).size.height * 0.059 : height,
      width: width == 0 ? MediaQuery.of(context).size.width * 0.8 : width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: TextFormField(
          textInputAction: TextInputAction.done,
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: keyboardType,
          cursorColor: AppColors.black,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: isFilled,
            fillColor: isFilled ? Colors.white : Colors.transparent,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10),
                    child: FaIcon(
                      prefixIcon,
                      color: prefixIconColor ?? Colors.black,
                      size: 18,
                    ),
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: FaIcon(
                      suffixIcon,
                      color: prefixIconColor ?? Colors.black,
                      size: 18,
                    ),
                  )
                : null,
            hintText: hintText,
            alignLabelWithHint: false,
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.grey.shade500,
                ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.black),
            ),
          ),
          maxLines: maxLines,
        ),
      ),
    );
  }
}
