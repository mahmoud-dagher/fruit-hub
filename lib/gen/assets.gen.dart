/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/images/apple.svg');

  /// File path: assets/images/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/images/facebook.svg');

  /// File path: assets/images/google.svg
  SvgGenImage get google => const SvgGenImage('assets/images/google.svg');

  /// File path: assets/images/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/page_view_item1_background.svg
  SvgGenImage get pageViewItem1Background =>
      const SvgGenImage('assets/images/page_view_item1_background.svg');

  /// File path: assets/images/page_view_item1_image.svg
  SvgGenImage get pageViewItem1Image =>
      const SvgGenImage('assets/images/page_view_item1_image.svg');

  /// File path: assets/images/page_view_item2_background.svg
  SvgGenImage get pageViewItem2Background =>
      const SvgGenImage('assets/images/page_view_item2_background.svg');

  /// File path: assets/images/page_view_item2_image.svg
  SvgGenImage get pageViewItem2Image =>
      const SvgGenImage('assets/images/page_view_item2_image.svg');

  /// File path: assets/images/plant.svg
  SvgGenImage get plant => const SvgGenImage('assets/images/plant.svg');

  /// File path: assets/images/splash_bottom.svg
  SvgGenImage get splashBottom =>
      const SvgGenImage('assets/images/splash_bottom.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    apple,
    facebook,
    google,
    logo,
    pageViewItem1Background,
    pageViewItem1Image,
    pageViewItem2Background,
    pageViewItem2Image,
    plant,
    splashBottom,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
