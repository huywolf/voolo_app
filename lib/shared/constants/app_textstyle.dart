// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:voolo_app/shared/constants/constants.dart';

class AppTextStyles {
  AppTextStyles._();

  static const double SMALL_FS = 14;
  static const double NORMAL_FS = 16;
  static const double MEDIUM_FS = 18;
  static const double LARGE_FS = 20;
  static const double MIDLE_LARGE_FS = 23;
  static const double EXTRA_LARGE_FS = 35;

  static const TextStyle SMALL = TextStyle(
    color: ColorConstants.BLACK_TEXT,
    fontSize: AppTextStyles.SMALL_FS,
  );

  static const TextStyle NORMAL = TextStyle(
    color: ColorConstants.BLACK_TEXT,
    fontSize: AppTextStyles.NORMAL_FS,
  );

  static const TextStyle NORMALBold = TextStyle(
    color: ColorConstants.BLACK_TEXT,
    fontSize: AppTextStyles.NORMAL_FS,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle MEDIUM = TextStyle(
    color: ColorConstants.BLACK_TEXT,
    fontSize: AppTextStyles.MEDIUM_FS,
  );

  static const TextStyle MEDIUM_BOLD = TextStyle(
    color: ColorConstants.BLACK_TEXT,
    fontSize: AppTextStyles.MEDIUM_FS,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle LARGE_BOLD = TextStyle(
    color: ColorConstants.BLACK_TEXT,
    fontSize: AppTextStyles.LARGE_FS,
    fontWeight: FontWeight.w700,
  );
}
