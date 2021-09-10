import 'package:mobx/mobx.dart';

part 'index_movies_stores.g.dart';

class IndexMoviesStore = _IndexMoviesStore with _$IndexMoviesStore;

abstract class _IndexMoviesStore with Store {

  @observable
  bool showSearchbar = false;

  @action
  void toggleSearchBar() {
    showSearchbar = !showSearchbar;
  }

}