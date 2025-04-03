import 'dart:async';
import 'dart:developer';

import 'package:cureocity_flutter_test/core/error/failure.dart';
import 'package:cureocity_flutter_test/features/Home/data/data_sources/data_source.dart';
import 'package:cureocity_flutter_test/features/Home/data/model/response_model.dart';
import 'package:cureocity_flutter_test/features/Home/domain/entity/response_entity.dart';
import 'package:cureocity_flutter_test/features/Home/domain/repository/get_contry_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetCountryRepositoryImpl implements GetContryRepository {
  final DataSource dataSource;
  GetCountryRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<Either<Failure, ResponseEntity>> getCountry() async {
    try {
     
      final result = await dataSource.fetchCoutries();
      log(result.exception.toString());

      final res = ResponseModel.fromMap(result.data!);

      return right(res);
    } catch (e) {
      return left(
        Failure(
         
        ),
      );
    }
  }
}
