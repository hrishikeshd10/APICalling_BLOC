import 'dart:async';

import 'package:apicallboss/MODEL/categorires.dart';
import 'package:apicallboss/NETWORKING/response_status.dart';
import 'package:apicallboss/REPOSITORY/category_repo.dart';


class ChuckCategoryBloc {
  ChuckCategoryRepository _chuckRepository;
  StreamController _chuckListController;

  StreamSink<Response<chuckCategories>> get chuckListSink =>
      _chuckListController.sink;

  Stream<Response<chuckCategories>> get chuckListStream =>
      _chuckListController.stream;

  ChuckCategoryBloc() {
    _chuckListController = StreamController<Response<chuckCategories>>();
    _chuckRepository = ChuckCategoryRepository();
    fetchCategories();
  }

  fetchCategories() async {
    chuckListSink.add(Response.loading('Getting Chuck Categories.'));
    try {
      chuckCategories chuckCats =
          await _chuckRepository.fetchChuckCategoryData();
      chuckListSink.add(Response.completed(chuckCats));
    } catch (e) {
      chuckListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckListController?.close();
  }
}