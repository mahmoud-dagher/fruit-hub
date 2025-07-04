import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/styles/text_style.dart';
import 'package:fruits_hub/features/auth/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    this.isVisible,
  });
  final String image, backgroundImage;
  final Widget title;
  final String subTitle;
  final bool? isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisible!,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginView.routName);
                    },
                    child: Text(
                      'تخط',
                      style: TextStyles.regular13.copyWith(
                        color: const Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
        ),
      ],
    );
  }
}
