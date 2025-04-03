import 'package:cureocity_flutter_test/core/serivce/service.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';

class DataSource {
  final Box _box = Hive.box('countriesBox'); // Access the Hive box

  Future<Map<String, dynamic>?> fetchCountries() async {
    final GraphQLClient client = GraphQLService.clients;

    const String query = '''
      query {
        countries {
          code
          name
          emoji
        }
      }
    ''';

    final QueryOptions options = QueryOptions(document: gql(query));
    final result = await client.query(options);

    if (result.hasException) {
      debugPrint("GraphQL Error: ${result.exception}");
      return _getCachedCountries(); // if API fails
    }

    //  Store data (Map<String, dynamic>) to Hive
    _box.put('countries', result.data);

    return result.data;
  }

  Map<String, dynamic>? _getCachedCountries() {
  final cachedData = _box.get('countries');

  if (cachedData == null) return null;

  return Map<String, dynamic>.from(cachedData);
}

}
