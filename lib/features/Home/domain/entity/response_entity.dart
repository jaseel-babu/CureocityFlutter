import 'package:cureocity_flutter_test/features/Home/data/model/response_model.dart';

class ResponseEntity {
  final List<CountriesModel> countries;
  ResponseEntity({
    required this.countries,
  });
}

class CountriesEntity {
  final String code;
  final String name;
  final String emoji;
  CountriesEntity({
    required this.code,
    required this.name,
    required this.emoji,
  });
}
