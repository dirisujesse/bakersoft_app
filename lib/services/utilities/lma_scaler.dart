import 'package:flutter/widgets.dart'
    show
        BuildContext,
        MediaQuery,
        MediaQueryData,
        EdgeInsets,
        RenderBox,
        Size,
        Offset;
import 'package:baker_app/data/models/enums/screen_type.dart';

class _BakerDimension {
  late MediaQueryData _queryData;

  _BakerDimension(BuildContext context) {
    _queryData = MediaQuery.of(context);
  }

  ScreenType get screenType {
    if (_queryData.size.width > 500) return ScreenType.TABLET;
    return ScreenType.MOBILE;
  }

  double get topInset {
    return _queryData.padding.top;
  }

  double get bottomInset {
    return _queryData.viewInsets.bottom;
  }

  double get shortestSide {
    return _queryData.size.shortestSide;
  }

  double get longestSide {
    return _queryData.size.longestSide;
  }

  double get width {
    return _queryData.size.width;
  }

  double get height {
    return _queryData.size.height;
  }

  double setLongestSide(double percentage) {
    if (percentage == 0) return 0;
    return longestSide * (percentage / 100);
  }

  double setShortestSide(double percentage) {
    if (percentage == 0) return 0;
    return shortestSide * (percentage / 100);
  }

  double setHeight(double percentage) {
    if (percentage == 0) return 0;
    return height * (percentage / 100);
  }

  double setWidth(double percentage) {
    if (percentage == 0) return 0;
    return width * (percentage / 100);
  }
}

class _BakerFontSizer {
  late num _scale;

  double _x(BuildContext context) {
    final x = MediaQuery.of(context).size.shortestSide;
    return x > 428 ? 428 : x;
  }

  double _y(BuildContext context) {
    final y = MediaQuery.of(context).size.longestSide;
    return y > 926 ? 926 : y;
  }

  _BakerFontSizer(BuildContext context) {
    final y = _y(context);
    final x = _x(context);
    _scale = (x + y) / 4;
  }

  double sp(double? percentage) {
    return (_scale * ((percentage ?? 40) / 1000)).floorToDouble();
  }

  double px(double? pixels) {
    return (1000 * ((pixels ?? 14)) / _scale).toDouble();
  }
}

class _BakerInsets {
  late _BakerDimension sizer;

  _BakerInsets(BuildContext context) {
    sizer = _BakerDimension(context);
  }

  EdgeInsets get zero {
    return EdgeInsets.zero;
  }

  EdgeInsets all(double inset) {
    return EdgeInsets.all(sizer.setShortestSide(inset));
  }

  EdgeInsets get defaultHorizontalInsets {
    return symmetric(horizontal: 5);
  }

  EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      top: sizer.setLongestSide(top),
      left: sizer.setShortestSide(left),
      bottom: sizer.setLongestSide(bottom),
      right: sizer.setShortestSide(right),
    );
  }

  EdgeInsets fromLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return EdgeInsets.fromLTRB(
      sizer.setShortestSide(left),
      sizer.setLongestSide(top),
      sizer.setShortestSide(right),
      sizer.setLongestSide(bottom),
    );
  }

  EdgeInsets symmetric({
    double vertical = 0,
    double horizontal = 0,
  }) {
    return EdgeInsets.symmetric(
      vertical: sizer.setLongestSide(vertical),
      horizontal: sizer.setShortestSide(horizontal),
    );
  }

  EdgeInsets copy(EdgeInsets insets) {
    return EdgeInsets.fromLTRB(
      insets.bottom,
      insets.top,
      insets.right,
      insets.bottom,
    );
  }
}

class BakerScaleUtil {
  final BuildContext context;
  static const double textScaleFactor = 1;

  BakerScaleUtil(this.context);
  BakerScaleUtil.of(this.context);

  _BakerDimension get sizer => _BakerDimension(context);
  _BakerFontSizer get fontSizer => _BakerFontSizer(context);
  _BakerInsets get insets => _BakerInsets(context);

  Offset get position {
    final RenderBox box = context.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero);
  }

  Size get size {
    final RenderBox box = context.findRenderObject() as RenderBox;
    return box.size;
  }
}
