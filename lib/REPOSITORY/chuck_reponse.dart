
import 'dart:async';

import 'package:apicallboss/MODEL/chuckResponse.dart';
import 'package:apicallboss/NETWORKING/api_provider.dart';

class ChuckRepository {
  ApiProvider _provider = ApiProvider();

  Future<chuckResponse> fetchChuckJoke(String category) async {
    final response = await _provider.get("jokes/random?category=" + category);
    return chuckResponse.fromJson(response);
  }
}