import 'package:cureocity_flutter_test/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border([Color color = AppColors.grey]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.black),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.white),
      bodyLarge: TextStyle(color: AppColors.black),
      bodyMedium: TextStyle(color: AppColors.grey),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(),
      border: _border(),
      focusedBorder: _border(AppColors.grey),
      contentPadding: const EdgeInsets.all(27),
      errorBorder: _border(AppColors.red),
    ),
  );
}
