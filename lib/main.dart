import 'package:cureocity_flutter_test/core/constants/theme/app_theme.dart';
import 'package:cureocity_flutter_test/features/Home/data/data_sources/data_source.dart';
import 'package:cureocity_flutter_test/features/Home/data/repository/get_country_repository_impl.dart';
import 'package:cureocity_flutter_test/features/Home/domain/usecase/get_contry_list.dart';
import 'package:cureocity_flutter_test/features/Home/presentation/bloc/home_bloc.dart';
import 'package:cureocity_flutter_test/features/Home/presentation/pages/home_page.dart';
import 'package:cureocity_flutter_test/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  initDependencies();
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
