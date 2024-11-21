import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  textTheme: TextTheme(
    bodyText1: TextStyle(color: AppColors.primary),
    bodyText2: TextStyle(color: AppColors.primary),
  ),
);
