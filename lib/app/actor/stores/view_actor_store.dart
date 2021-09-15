import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:movie_sky/app/actor/models/Person.dart';
import 'package:movie_sky/app/movie/models/Movie.dart';
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';
import 'package:http/http.dart' as http;
import 'package:movie_sky/config/config.dart';

part 'view_actor_store.g.dart';

class ViewActorStore = _ViewActorStore with _$ViewActorStore; 

abstract class _ViewActorStore with Store {

  void getActor(int actorId) async {

    http.Response response = await http.get(Uri.parse('$BASE_URL/person/$actorId?api_key=$API_KEY'));
    Map<String, dynamic> actor = jsonDecode(response.body);

    Person newActor = Person.fromMap(actor);

    setActor(newActor);

    http.Response moviesResponse = await http.get(Uri.parse('$BASE_URL/discover/movie?with_cast=$actorId&sort_by=vote_average.desc&api_key=$API_KEY'));
    Map<String, dynamic> movies = jsonDecode(moviesResponse.body);

    List<Movie> newMovies = movies['results'].map<Movie>((e) {
      return Movie.fromMap(e);
    }).toList();

    setMovies(newMovies);

    setStatus(Status.IDLE);

  }

  @observable
  Status status = Status.LOADING;

  @action
  void setStatus(Status status) {
    this.status = status;
  }

  @observable
  Person? actor;

  @action
  void setActor(Person actor) {
    this.actor = actor;
  }

  final ObservableList<Movie> movies = ObservableList();

  @action
  void setMovies(List<Movie> movies) {
    this.movies.addAll(movies);
  }

}