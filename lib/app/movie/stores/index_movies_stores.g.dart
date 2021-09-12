// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_movies_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IndexMoviesStore on _IndexMoviesStore, Store {
  final _$statusAtom = Atom(name: '_IndexMoviesStore.status');

  @override
  Status get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$popularPickAtom = Atom(name: '_IndexMoviesStore.popularPick');

  @override
  Movie? get popularPick {
    _$popularPickAtom.reportRead();
    return super.popularPick;
  }

  @override
  set popularPick(Movie? value) {
    _$popularPickAtom.reportWrite(value, super.popularPick, () {
      super.popularPick = value;
    });
  }

  final _$popularMoviesAtom = Atom(name: '_IndexMoviesStore.popularMovies');

  @override
  ObservableList<Movie> get popularMovies {
    _$popularMoviesAtom.reportRead();
    return super.popularMovies;
  }

  @override
  set popularMovies(ObservableList<Movie> value) {
    _$popularMoviesAtom.reportWrite(value, super.popularMovies, () {
      super.popularMovies = value;
    });
  }

  final _$loadedPagesAtom = Atom(name: '_IndexMoviesStore.loadedPages');

  @override
  int get loadedPages {
    _$loadedPagesAtom.reportRead();
    return super.loadedPages;
  }

  @override
  set loadedPages(int value) {
    _$loadedPagesAtom.reportWrite(value, super.loadedPages, () {
      super.loadedPages = value;
    });
  }

  final _$showSearchbarAtom = Atom(name: '_IndexMoviesStore.showSearchbar');

  @override
  bool get showSearchbar {
    _$showSearchbarAtom.reportRead();
    return super.showSearchbar;
  }

  @override
  set showSearchbar(bool value) {
    _$showSearchbarAtom.reportWrite(value, super.showSearchbar, () {
      super.showSearchbar = value;
    });
  }

  final _$loadMoreMoviesAsyncAction =
      AsyncAction('_IndexMoviesStore.loadMoreMovies');

  @override
  Future<void> loadMoreMovies() {
    return _$loadMoreMoviesAsyncAction.run(() => super.loadMoreMovies());
  }

  final _$_IndexMoviesStoreActionController =
      ActionController(name: '_IndexMoviesStore');

  @override
  void setStatus(Status status) {
    final _$actionInfo = _$_IndexMoviesStoreActionController.startAction(
        name: '_IndexMoviesStore.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$_IndexMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPopularPick(Movie popularPick) {
    final _$actionInfo = _$_IndexMoviesStoreActionController.startAction(
        name: '_IndexMoviesStore.setPopularPick');
    try {
      return super.setPopularPick(popularPick);
    } finally {
      _$_IndexMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPopularMovies(List<Movie> movies) {
    final _$actionInfo = _$_IndexMoviesStoreActionController.startAction(
        name: '_IndexMoviesStore.setPopularMovies');
    try {
      return super.setPopularMovies(movies);
    } finally {
      _$_IndexMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSearchBar() {
    final _$actionInfo = _$_IndexMoviesStoreActionController.startAction(
        name: '_IndexMoviesStore.toggleSearchBar');
    try {
      return super.toggleSearchBar();
    } finally {
      _$_IndexMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
popularPick: ${popularPick},
popularMovies: ${popularMovies},
loadedPages: ${loadedPages},
showSearchbar: ${showSearchbar}
    ''';
  }
}
