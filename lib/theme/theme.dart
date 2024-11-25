import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.primary),
    // bodyText2: TextStyle(color: AppColors.primary),
  ),
);
