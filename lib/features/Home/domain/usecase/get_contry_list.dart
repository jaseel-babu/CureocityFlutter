import 'package:cureocity_flutter_test/core/error/failure.dart';
import 'package:cureocity_flutter_test/features/Home/domain/entity/response_entity.dart';
import 'package:cureocity_flutter_test/features/Home/domain/repository/get_contry_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetCountryList {
  final GetContryRepository getContryRepository;
  GetCountryList({
    required this.getContryRepository,
  });
 
   Future<Either<Failure, ResponseEntity>> getCoutries() async {
    final response = await getContryRepository.getCountry();
    return response;
  }
}
