import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/styles/text_style.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
  );
}
