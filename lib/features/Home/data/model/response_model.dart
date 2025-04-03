import 'package:cureocity_flutter_test/features/Home/domain/entity/response_entity.dart';

// class ResponseModel extends ResponseEntity {
//   ResponseModel({
//     required super.dataModel,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'dataModel': dataModel.toMap(),
//     };
//   }

//   factory ResponseModel.fromMap(Map<String, dynamic> map) {
//     return ResponseModel(
//       dataModel: DataModel.fromMap(map['dataModel']),
//     );
//   }
// }

class ResponseModel extends ResponseEntity {
  ResponseModel({
    required super.countries,
  });

  Map<String, dynamic> toMap() {
    return {
      'countries': countries.map((x) => x.toMap()).toList(),
    };
  }

 factory ResponseModel.fromMap(Map<String, dynamic> map) {
 

  return ResponseModel(
    countries: (map['countries'] as List<dynamic>?)
        ?.map((x) => CountriesModel.fromMap(Map<String, dynamic>.from(x)))
        .toList() ?? [],
  );
}

}

class CountriesModel extends CountriesEntity {
  CountriesModel({
    required super.code,
    required super.name,
    required super.emoji,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'emoji': emoji,
    };
  }

  factory CountriesModel.fromMap(Map<String, dynamic> map) {
    return CountriesModel(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      emoji: map['emoji'] ?? '',
    );
  }
}
