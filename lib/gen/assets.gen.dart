import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/svg
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();

  /// File path: assets/images/onboarding/onboarding_1.png
  AssetGenImage get onBoarding1 =>
      const AssetGenImage('assets/images/onboarding/onboarding_1.png');

  /// File path: assets/images/onboarding/onboarding_1.png
  AssetGenImage get onBoarding2 =>
      const AssetGenImage('assets/images/onboarding/onboarding_2.png');

  /// File path: assets/images/onboarding/onboarding_1.png
  AssetGenImage get onBoarding3 =>
      const AssetGenImage('assets/images/onboarding/onboarding_3.png');

  List<AssetGenImage> get values => [onBoarding1, onBoarding2, onBoarding3];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/ic_sale_point.svg
  SvgGenImage get icAppLogo =>
      const SvgGenImage('assets/images/svg/ic_app_logo.svg');

  /// File path: assets/images/svg/ic_checkout.svg
  SvgGenImage get icCheckout =>
      const SvgGenImage('assets/images/svg/ic_checkout.svg');

  /// File path: assets/images/svg/ic_orders.svg
  SvgGenImage get icOrders =>
      const SvgGenImage('assets/images/svg/ic_orders.svg');

  /// File path: assets/images/svg/ic_settle.svg
  SvgGenImage get icSettle =>
      const SvgGenImage('assets/images/svg/ic_settle.svg');

  /// File path: assets/images/svg/ic_report.svg
  SvgGenImage get icReport =>
      const SvgGenImage('assets/images/svg/ic_report.svg');

  /// File path: assets/images/svg/ic_settings.svg
  SvgGenImage get icSettings =>
      const SvgGenImage('assets/images/svg/ic_settings.svg');

  /// File path: assets/images/svg/ic_more.svg
  SvgGenImage get icMore => const SvgGenImage('assets/images/svg/ic_more.svg');

  /// File path: assets/images/svg/ic_settings.svg
  SvgGenImage get icStar => const SvgGenImage('assets/images/svg/ic_star.svg');

  /// File path: assets/images/svg/ic_eye_on.svg
  SvgGenImage get icEyeOn =>
      const SvgGenImage('assets/images/svg/ic_eye_on.svg');

  /// File path: assets/images/svg/ic_eye_off.svg
  SvgGenImage get icEyeOff =>
      const SvgGenImage('assets/images/svg/ic_eye_off.svg');

  /// File path: assets/images/svg/ic_google.svg
  SvgGenImage get icGoogle =>
      const SvgGenImage('assets/images/svg/ic_google.svg');

  /// File path: assets/images/svg/ic_arrow_left.svg
  SvgGenImage get icArrowLeft =>
      const SvgGenImage('assets/images/svg/ic_arrow_left.svg');

  /// File path: assets/images/svg/ic_chevron_next.svg
  SvgGenImage get icChevronNext =>
      const SvgGenImage('assets/images/svg/ic_chevron_next.svg');

  /// File path: assets/images/svg/ic_checked.svg
  SvgGenImage get icChecked =>
      const SvgGenImage('assets/images/svg/ic_checked.svg');

  /// File path: assets/images/svg/ic_arrow_right.svg
  SvgGenImage get icArrowRight =>
      const SvgGenImage('assets/images/svg/ic_arrow_right.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    icAppLogo,
    icCheckout,
    icOrders,
    icSettle,
    icReport,
    icSettings,
    icMore,
    icStar,
    icEyeOn,
    icEyeOff,
    icGoogle,
    icArrowLeft,
    icChevronNext,
    icChecked,
    icArrowRight,
  ];
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

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
