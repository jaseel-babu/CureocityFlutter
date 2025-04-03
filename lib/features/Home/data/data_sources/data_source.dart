import 'dart:convert';
import 'dart:developer';

import 'package:cureocity_flutter_test/core/serivce/service.dart';
import 'package:cureocity_flutter_test/features/Home/data/model/response_model.dart';
import 'package:dio/dio.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DataSource { 
  Future<QueryResult> fetchCoutries() async {
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
    return await client.query(options);
  }
}
