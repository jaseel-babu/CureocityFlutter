import 'package:cureocity_flutter_test/core/constants/theme/app_theme.dart';
import 'package:cureocity_flutter_test/features/Home/presentation/bloc/home_bloc.dart';
import 'package:cureocity_flutter_test/features/Home/presentation/pages/home_page.dart';
import 'package:cureocity_flutter_test/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  await Hive.initFlutter();
  await Hive.openBox('countriesBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Country List',
        theme: AppTheme.theme,
        home: const HomePage(),
      ),
    );
  }
}
