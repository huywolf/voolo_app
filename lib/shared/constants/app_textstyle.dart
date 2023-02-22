import 'package:flutter/material.dart';
import 'package:voolo_app/shared/constants/constants.dart';

class AppTextStyles {
  static const double smallFS = 14;
  static const double normalFS = 16;
  static const double mediumFS = 18;
  static const double largeFS = 20;
  static const double midleLargeFS = 23;
  static const double extraLargeFS = 35;

  static const TextStyle appBarTitle = TextStyle(
    fontSize: AppTextStyles.largeFS,
    color: ColorConstants.blackText,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle small = TextStyle(
    color: ColorConstants.blackText,
    fontSize: AppTextStyles.smallFS,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle normal = TextStyle(
    color: ColorConstants.blackText,
    fontSize: AppTextStyles.normalFS,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle normalBold = TextStyle(
    color: ColorConstants.blackText,
    fontSize: AppTextStyles.normalFS,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle medium = TextStyle(
    color: ColorConstants.blackText,
    fontSize: AppTextStyles.mediumFS,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle mediumBold = TextStyle(
    color: ColorConstants.blackText,
    fontSize: AppTextStyles.mediumFS,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle largeBold = TextStyle(
    color: ColorConstants.blackText,
    fontSize: AppTextStyles.largeFS,
    fontWeight: FontWeight.w700,
  );

  ///Singleton factory
  static final _instance = AppTextStyles._internal();
  factory AppTextStyles() {
    return _instance;
  }
  AppTextStyles._internal();
}
