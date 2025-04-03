import 'package:cureocity_flutter_test/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.black),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.white),
      bodyLarge: TextStyle(color: AppColors.black),
      bodyMedium: TextStyle(color: AppColors.grey),
    ),
  );
}
