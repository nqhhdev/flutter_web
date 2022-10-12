/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_splash.png
  AssetGenImage get icSplash =>
      const AssetGenImage('assets/images/ic_splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [icSplash];
}

class Assets {
  Assets._();

  static const SvgGenImage bank = SvgGenImage('assets/bank.svg');
  static const SvgGenImage calendar = SvgGenImage('assets/calendar.svg');
  static const AssetGenImage card = AssetGenImage('assets/card.png');
  static const SvgGenImage clipboard = SvgGenImage('assets/clipboard.svg');
  static const SvgGenImage creditCard = SvgGenImage('assets/credit-card.svg');
  static const SvgGenImage document = SvgGenImage('assets/document.svg');
  static const SvgGenImage drop = SvgGenImage('assets/drop.svg');
  static const SvgGenImage electricity = SvgGenImage('assets/electricity.svg');
  static const SvgGenImage home = SvgGenImage('assets/home.svg');
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const SvgGenImage invoice = SvgGenImage('assets/invoice.svg');
  static const SvgGenImage macAction = SvgGenImage('assets/mac-action.svg');
  static const AssetGenImage man = AssetGenImage('assets/man.jpeg');
  static const SvgGenImage pieChart = SvgGenImage('assets/pie-chart.svg');
  static const SvgGenImage ring = SvgGenImage('assets/ring.svg');
  static const SvgGenImage salary = SvgGenImage('assets/salary.svg');
  static const SvgGenImage search = SvgGenImage('assets/search.svg');
  static const SvgGenImage settings = SvgGenImage('assets/settings.svg');
  static const SvgGenImage transfer = SvgGenImage('assets/transfer.svg');
  static const SvgGenImage trophy = SvgGenImage('assets/trophy.svg');
  static const SvgGenImage wifi = SvgGenImage('assets/wifi.svg');

  /// List of all assets
  List<dynamic> get values => [
        bank,
        calendar,
        card,
        clipboard,
        creditCard,
        document,
        drop,
        electricity,
        home,
        invoice,
        macAction,
        man,
        pieChart,
        ring,
        salary,
        search,
        settings,
        transfer,
        trophy,
        wifi
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
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
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
