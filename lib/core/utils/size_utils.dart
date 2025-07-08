import 'package:flutter/cupertino.dart';

class SizeUtils {
  static final SizeUtils _sizeUtils = SizeUtils._();
  factory SizeUtils() => _sizeUtils;
  SizeUtils._();
  static late MediaQueryData mediaQueryData;
  static double height = 0.0;
  static double width = 0.0;
  static late TextScaler textScalar;
  static initFun(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    height = mediaQueryData.size.height;
    width = mediaQueryData.size.width;
    textScalar = mediaQueryData.textScaler;
  }

  static hp(double val) => (val * height) / 100;
  static wp(double val) => (val * width) / 100;
  static double sp(double fontSize) => textScalar.scale(fontSize);
}

extension SizeExtension on num {
  double get h => SizeUtils.hp(toDouble());
  double get w => SizeUtils.wp(toDouble());
  double get sp => SizeUtils.sp(toDouble());
}
