import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:movie_sky/app/movie/models/Movie.dart';
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
      Map<dynamic, dynamic> movies = jsonDecode(response.body);

      List<Movie> popularMovies = movies['results'].map<Movie>((movie) {
        return Movie.fromMap(movie);
      }).toList();

      setPopularPick(popularMovies[0]);

      popularMovies.removeAt(0);

      setPopularMovies(popularMovies);

      setStatus(Status.IDLE);

    });
  }

  @observable
  Status status = Status.LOADING;

  @action
  void setStatus(Status status) {
    this.status = status;
  }

  @observable
  Movie? popularPick;

  @action
  void setPopularPick(Movie popularPick) {
    this.popularPick = popularPick;
  }

  @observable
  ObservableList<Movie> popularMovies = ObservableList<Movie>();

  @action
  void setPopularMovies(List<Movie> movies) {
    this.popularMovies.clear();
    this.popularMovies.addAll(movies);
  }

  @observable
  int loadedPages = 1;

  @action
  Future<void> loadMoreMovies() async {

    loadedPages++;

    if(loadedPages > 500) return;

    http.Response response = await http.get(Uri.parse('$BASE_URL/discover/movie?sort_by=popularity.desc&page=$loadedPages&api_key=$API_KEY'));
    Map<dynamic, dynamic> movies = jsonDecode(response.body);

    List<Movie> popularMovies = movies['results'].map<Movie>((movie) {
      return Movie.fromMap(movie);
    }).toList();

    popularMovies.addAll(popularMovies);

    this.status = Status.IDLE;

  }

  @observable
  bool showSearchbar = false;

  @action
  void toggleSearchBar() {
    showSearchbar = !showSearchbar;
  }

}