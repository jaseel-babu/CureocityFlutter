import 'package:cureocity_flutter_test/core/error/failure.dart';
import 'package:cureocity_flutter_test/features/Home/domain/entity/response_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GetContryRepository {
  Future<Either<Failure, ResponseEntity>> getCountry();
}
