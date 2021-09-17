import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:movie_sky/app/actor/models/Person.dart';
import 'package:http/http.dart' as http;
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';
import 'package:movie_sky/config/config.dart';

part 'view_movie_store.g.dart';

class ViewMovieStore = _ViewMovieStore with _$ViewMovieStore;

abstract class _ViewMovieStore with Store {

  @observable
  Status status = Status.LOADING;

  @action
  void setStatus(Status status) {
    this.status = status;
  }

  final List<Person> cast = ObservableList<Person>();

  @action
  void setCast(List<Person> cast) {
    this.cast.clear();
    this.cast.addAll(cast);
  }

  void getCast(int movieId) async {

    http.Response response = await http.get(Uri.parse('$BASE_URL/movie/$movieId/credits?api_key=$API_KEY'));
    Map<String, dynamic> castMap = jsonDecode(response.body);

    List<Person> cast = castMap['cast'].map<Person>((e) {
      return Person.fromMap(e);
    }).toList();

    setCast(cast);

    setStatus(Status.IDLE);

  }

}