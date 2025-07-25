// ignore_for_file: deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/styles/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,

    this.suffixIcon,
    this.prefixIcon,
    required this.inputType,
    this.onSaved,
    this.onChanged,

    this.useFloatingLabel = false,
    this.backgroundColor,
    this.controller,
    this.obscureText = false,

    this.hint,
  });

  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final String? hint;
  final TextInputType inputType;
  final void Function(String?)? onSaved;
  final ValueSetter<String>? onChanged;

  final bool useFloatingLabel;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(hint.toString()),
      keyboardType: inputType,
      obscureText: obscureText,

      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hint';
        }
        return null;
      },
      onChanged: onChanged,
      controller: controller,
      style: const TextStyle(overflow: TextOverflow.ellipsis),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFA), // Use custom or default
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        labelText: useFloatingLabel ? hint : null,
        hintText: useFloatingLabel ? null : hint,
        labelStyle: const TextStyle(color: null),
        hintStyle: TextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: null) : null,
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: color ?? const Color(0xFFE6E9E9), width: 1),
    );
  }
}
