import 'dart:async';

import 'package:apicallboss/MODEL/categorires.dart';
import 'package:apicallboss/NETWORKING/api_provider.dart';

class ChuckCategoryRepository {
  ApiProvider _provider = ApiProvider();

  Future<chuckCategories> fetchChuckCategoryData() async {
    final response = await _provider.get("jokes/categories");
    return chuckCategories.fromJson(response);
  }
}