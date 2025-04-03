import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
 static HttpLink httpLink = HttpLink('https://countries.trevorblades.com/');

  static final Link link = httpLink;

  static GraphQLClient get clients {
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
    );
  }
}