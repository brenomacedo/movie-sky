// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WatchListStore on _WatchListStore, Store {
  final _$statusAtom = Atom(name: '_WatchListStore.status');

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

  final _$_WatchListStoreActionController =
      ActionController(name: '_WatchListStore');

  @override
  void setStatus(Status status) {
    final _$actionInfo = _$_WatchListStoreActionController.startAction(
        name: '_WatchListStore.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$_WatchListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMovies(List<MovieToWatch> movies) {
    final _$actionInfo = _$_WatchListStoreActionController.startAction(
        name: '_WatchListStore.setMovies');
    try {
      return super.setMovies(movies);
    } finally {
      _$_WatchListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeMovie(MovieToWatch movie) {
    final _$actionInfo = _$_WatchListStoreActionController.startAction(
        name: '_WatchListStore.removeMovie');
    try {
      return super.removeMovie(movie);
    } finally {
      _$_WatchListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
