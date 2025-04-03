import 'package:cureocity_flutter_test/core/constants/theme/app_theme.dart';
import 'package:cureocity_flutter_test/features/Home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Country List',
      theme: AppTheme.theme,
      home: const HomePage(),
    );
  }
}
