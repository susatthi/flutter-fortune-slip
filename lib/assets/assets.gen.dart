/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/omikuji_chuukichi.png
  AssetGenImage get omikujiChuukichi =>
      const AssetGenImage('assets/images/omikuji_chuukichi.png');

  /// File path: assets/images/omikuji_daikichi.png
  AssetGenImage get omikujiDaikichi =>
      const AssetGenImage('assets/images/omikuji_daikichi.png');

  /// File path: assets/images/omikuji_daikyou.png
  AssetGenImage get omikujiDaikyou =>
      const AssetGenImage('assets/images/omikuji_daikyou.png');

  /// File path: assets/images/omikuji_kichi.png
  AssetGenImage get omikujiKichi =>
      const AssetGenImage('assets/images/omikuji_kichi.png');

  /// File path: assets/images/omikuji_kyou.png
  AssetGenImage get omikujiKyou =>
      const AssetGenImage('assets/images/omikuji_kyou.png');

  /// File path: assets/images/omikuji_suekichi.png
  AssetGenImage get omikujiSuekichi =>
      const AssetGenImage('assets/images/omikuji_suekichi.png');

  /// File path: assets/images/omikuji_syoukichi.png
  AssetGenImage get omikujiSyoukichi =>
      const AssetGenImage('assets/images/omikuji_syoukichi.png');

  /// File path: assets/images/syougatsu2_omijikuji2.png
  AssetGenImage get syougatsu2Omijikuji2 =>
      const AssetGenImage('assets/images/syougatsu2_omijikuji2.png');

  /// File path: assets/images/title.png
  AssetGenImage get title => const AssetGenImage('assets/images/title.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        omikujiChuukichi,
        omikujiDaikichi,
        omikujiDaikyou,
        omikujiKichi,
        omikujiKyou,
        omikujiSuekichi,
        omikujiSyoukichi,
        syougatsu2Omijikuji2,
        title
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
