// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_movies_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IndexMoviesStore on _IndexMoviesStore, Store {
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

  final _$_IndexMoviesStoreActionController =
      ActionController(name: '_IndexMoviesStore');

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
showSearchbar: ${showSearchbar}
    ''';
  }
}
