// ignore_for_file: deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/styles/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.prefixIcon,
    required this.inputType,
    this.onSaved,
    this.onChanged,
    this.maxLines,
    this.useFloatingLabel = false,
    this.backgroundColor,
    this.controller,
  });

  final String? hint;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? inputType;
  final void Function(String?)? onSaved;
  final ValueSetter<String>? onChanged;
  final int? maxLines;
  final bool useFloatingLabel;
  final Color? backgroundColor;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(hint!),
      keyboardType: inputType,
      obscureText: hint == 'Enter Password' ? true : false,

      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hint';
        }
        return null;
      },
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines,
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
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: const Color(0xffC9CECF))
            : null,
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
