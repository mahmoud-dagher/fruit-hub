import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/styles/app_colors.dart';
import 'package:fruits_hub/core/utils/styles/text_style.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({super.key, this.text, required this.onTap});
  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text ?? '',
          style: TextStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
