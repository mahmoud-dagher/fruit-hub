import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/helper_functions/navigation.dart';
import 'package:fruits_hub/core/utils/app_images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment:
              Localizations.localeOf(context).languageCode == 'ar'
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [SvgPicture.asset(Assets.assetsImagesPlant)],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        Expanded(
          child: Flexible(
            child: SvgPicture.asset(
              Assets.assetsImagesSplashBottom,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
