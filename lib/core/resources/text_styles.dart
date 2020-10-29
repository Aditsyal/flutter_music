import 'package:flutter/material.dart';
import 'package:flutter_music_player/core/resources/app_colors.dart';

class AppTextStyles {

  static TextStyle get songTitleTextStyle => TextStyle(
      color: AppColors.accentColor,
      fontWeight: FontWeight.w500,
      fontSize: 22);

  static TextStyle get songSubTitleTextStyle => TextStyle(color: AppColors.accentColor);

  static TextStyle get songDurationTextStyle => TextStyle(color: AppColors.accentColor);

  static TextStyle get songPositionTextStyle => TextStyle(color: AppColors.accentColor.withOpacity(0.5));
}