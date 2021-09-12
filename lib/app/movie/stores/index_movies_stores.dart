import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:movie_sky/config/config.dart';
part 'index_movies_stores.g.dart';

enum Status {
  IDLE,
  LOADING
}

class IndexMoviesStore = _IndexMoviesStore with _$IndexMoviesStore;

abstract class _IndexMoviesStore with Store {

  _IndexMoviesStore() {
    autorun((_) async {
      
      http.Response response = await http.get(Uri.parse('$BASE_URL/discover/movie?sort_by=popularity.desc&api_key=$API_KEY'));
      List<Map<dynamic, dynamic>> movies = jsonDecode(response.body);

      

    });
  }

  @observable
  Status status = Status.LOADING;

  @action
  void setStatus(Status status) {
    this.status = status;
  }

  @observable
  bool showSearchbar = false;

  @action
  void toggleSearchBar() {
    showSearchbar = !showSearchbar;
  }

}