import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:movie_sky/app/actor/models/Person.dart';
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';
import 'package:movie_sky/config/config.dart';
import 'package:http/http.dart' as http;

part 'index_actor_store.g.dart';

class IndexActorsStore = _IndexActorsStore with _$IndexActorsStore;

abstract class _IndexActorsStore with Store {

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
  String lastQueryUrl = '$BASE_URL/person/popular?api_key=$API_KEY';

  @action
  void setLastQueryUrl(String lastQueryUrl) {
    this.lastQueryUrl = lastQueryUrl;
  }

  @computed
  String get lastQueryUrlPage {
    return '$lastQueryUrl&page=$loadedPages';
  }
  
  final ObservableList<Person> actors = ObservableList();

  @action
  void setActors(List<Person> actors) {
    this.actors.clear();
    this.actors.addAll(actors);
  }

  @action
  void addActors(List<Person> actors) {
    this.actors.addAll(actors);
  }

  Future<void> loadMoreMovies() async {

    this.loadedPages++;

    if(this.loadedPages > this.limitPages) return;

    http.Response response = await http.get(Uri.parse(lastQueryUrlPage));
    Map<dynamic, dynamic> actors = jsonDecode(response.body);

    this.limitPages = actors['total_pages'];

    List<Person> newActors = actors['results'].map<Person>((e) {
      return Person.fromMap(e);
    }).toList();

    addActors(newActors);

  }

  Future<Response> searchActorByName() async {
    
    http.Response response = await http.get(Uri.parse('$BASE_URL/search/person?api_key=$API_KEY&query=$searchField'));
    setLastQueryUrl('$BASE_URL/search/person?api_key=$API_KEY&query=$searchField');

    Map<dynamic, dynamic> actors = jsonDecode(response.body);

    if(actors['results'].length == 0) {
      return Response.ERROR;
    }

    setLimitPages(actors['total_pages']);
    resetLoadedPages();

    List<Person> newActors = actors['results'].map<Person>((movie) {
      return Person.fromMap(movie);
    }).toList();

    setActors(newActors);

    return Response.SUCCESS;
  }

  // ==================== Search fields ======================

  @observable
  String searchField = '';

  @action
  void setSearchField(String searchField) {
    this.searchField = searchField;
  }

}