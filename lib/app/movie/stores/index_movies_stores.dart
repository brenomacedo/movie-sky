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

  final ObservableList<Movie> popularMovies = ObservableList<Movie>();

  @action
  void setPopularMovies(List<Movie> movies) {
    this.popularMovies.clear();
    this.popularMovies.addAll(movies);
  }

  @observable
  int loadedPages = 0;

  @action
  void resetLoadedPages() {
    this.loadedPages = 1;
  }

  @observable
  int limitPages = 500;

  @action
  void setLimitPages(int limitPages) {
    this.limitPages = limitPages;
  }

  @observable
  String lastQueryUrl = '$BASE_URL/discover/movie?sort_by=popularity.desc&api_key=$API_KEY';

  @action
  void setLastQueryUrl(String lastQueryUrl) {
    this.lastQueryUrl = lastQueryUrl;
  }

  @computed
  String get lastQueryUrlPage {
    return '$lastQueryUrl&page=$loadedPages';
  }

  Future<void> searchMovieByName() async {
    setStatus(Status.LOADING);
    
    http.Response response = await http.get(Uri.parse('$BASE_URL/search/movie?sort_by=popularity.desc&api_key=$API_KEY&query=$searchField'));
    setLastQueryUrl('$BASE_URL/search/movie?sort_by=popularity.desc&api_key=$API_KEY&query=$searchField');

    setSearchField('');
    toggleSearchBar();

    Map<dynamic, dynamic> movies = jsonDecode(response.body);

    setLimitPages(movies['total_pages']);
    resetLoadedPages();

    List<Movie> popularMovies = movies['results'].map<Movie>((movie) {
      return Movie.fromMap(movie);
    }).toList();

    setPopularPick(popularMovies[0]);

    popularMovies.removeAt(0);

    setPopularMovies(popularMovies);

    setStatus(Status.IDLE);
  }

  Future<void> searchByGenre(int genreId) async {
    setStatus(Status.LOADING);
  
    http.Response response = await http.get(Uri.parse('$BASE_URL/discover/movie?sort_by=popularity.desc&with_genres=$genreId&api_key=$API_KEY'));
    setLastQueryUrl('$BASE_URL/discover/movie?sort_by=popularity.desc&with_genres=$genreId&api_key=$API_KEY');

    Map<dynamic, dynamic> movies = jsonDecode(response.body);

    setLimitPages(movies['total_pages']);
    resetLoadedPages();

    List<Movie> popularMovies = movies['results'].map<Movie>((movie) {
      return Movie.fromMap(movie);
    }).toList();

    setPopularPick(popularMovies[0]);

    popularMovies.removeAt(0);

    setPopularMovies(popularMovies);

    setStatus(Status.IDLE);
  }

  @action
  Future<void> loadMoreMovies() async {

    this.loadedPages++;

    if(this.loadedPages > this.limitPages) return;

    http.Response response = await http.get(Uri.parse(lastQueryUrlPage));
    Map<dynamic, dynamic> movies = jsonDecode(response.body);

    this.limitPages = movies['total_pages'];

    List<Movie> popularMovies = movies['results'].map<Movie>((movie) {
      return Movie.fromMap(movie);
    }).toList();

    if(movies['page'] == 1) {
      setPopularPick(popularMovies[0]);
      popularMovies.removeAt(0);
    }

    this.popularMovies.addAll(popularMovies);

    this.status = Status.IDLE;

  }

  @computed
  bool get loadedAll => this.loadedPages == this.limitPages;

  @observable
  bool showSearchbar = false;

  @action
  void toggleSearchBar() {
    showSearchbar = !showSearchbar;
  }

  // ================= TEXT FIELDS CONTROLLERS ====================

  @observable
  String searchField = '';

  @action
  void setSearchField(String searchField) {
    this.searchField = searchField;
  }

}