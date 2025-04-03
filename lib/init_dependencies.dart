import 'package:cureocity_flutter_test/features/Home/data/data_sources/data_source.dart';
import 'package:cureocity_flutter_test/features/Home/data/repository/get_country_repository_impl.dart';
import 'package:cureocity_flutter_test/features/Home/domain/repository/get_contry_repository.dart';
import 'package:cureocity_flutter_test/features/Home/domain/usecase/get_contry_list.dart';
import 'package:cureocity_flutter_test/features/Home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> initDependencies()async {
  //DataSource
  getIt
    ..registerFactory<DataSource>(
      () => DataSource(),
    )

    //Repository
    ..registerFactory<GetContryRepository>(
      () => GetCountryRepositoryImpl(dataSource: getIt()),
    )
    //Usecase
    ..registerFactory(
      () => GetCountryList(
        getContryRepository: getIt(),
      ),
    )
    //bloc
    ..registerLazySingleton(() => HomeBloc(getIt()));
}
