import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_sky/app/auth/stores/auth_store.dart';
import 'package:movie_sky/app/movie/models/MovieToWatch.dart';
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';

part 'watchlist_store.g.dart';

class WatchListStore = _WatchListStore with _$WatchListStore;

abstract class _WatchListStore with Store {

  final authStore = Modular.get<AuthStore>();

  @observable
  Status status = Status.LOADING;

  @action
  void setStatus(Status status) {
    this.status = status;
  }

  final ObservableList<MovieToWatch> movies = ObservableList();

  @action
  void setMovies(List<MovieToWatch> movies) {
    this.movies.clear();
    this.movies.addAll(movies);
  }

  @action
  void removeMovie(MovieToWatch movie) {
    this.movies.remove(movie);
  }

  Future<void> getMovies() async {

    QuerySnapshot movies = await FirebaseFirestore.instance.collection(authStore.user!.id).get();
    List<MovieToWatch> newMovies = movies.docs.map((e) {
      return MovieToWatch.fromDocument(e);
    }).toList();

    setMovies(newMovies);

    setStatus(Status.IDLE);

  }

  Future<void> deleteMovie(MovieToWatch movie) async {
    await FirebaseFirestore.instance.collection(authStore.user!.id).doc('${movie.id}').delete();
    removeMovie(movie);
  }

}