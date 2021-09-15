// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_actor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IndexActorsStore on _IndexActorsStore, Store {
  Computed<String>? _$lastQueryUrlPageComputed;

  @override
  String get lastQueryUrlPage => (_$lastQueryUrlPageComputed ??=
          Computed<String>(() => super.lastQueryUrlPage,
              name: '_IndexActorsStore.lastQueryUrlPage'))
      .value;

  final _$loadedPagesAtom = Atom(name: '_IndexActorsStore.loadedPages');

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

  final _$limitPagesAtom = Atom(name: '_IndexActorsStore.limitPages');

  @override
  int get limitPages {
    _$limitPagesAtom.reportRead();
    return super.limitPages;
  }

  @override
  set limitPages(int value) {
    _$limitPagesAtom.reportWrite(value, super.limitPages, () {
      super.limitPages = value;
    });
  }

  final _$lastQueryUrlAtom = Atom(name: '_IndexActorsStore.lastQueryUrl');

  @override
  String get lastQueryUrl {
    _$lastQueryUrlAtom.reportRead();
    return super.lastQueryUrl;
  }

  @override
  set lastQueryUrl(String value) {
    _$lastQueryUrlAtom.reportWrite(value, super.lastQueryUrl, () {
      super.lastQueryUrl = value;
    });
  }

  final _$searchFieldAtom = Atom(name: '_IndexActorsStore.searchField');

  @override
  String get searchField {
    _$searchFieldAtom.reportRead();
    return super.searchField;
  }

  @override
  set searchField(String value) {
    _$searchFieldAtom.reportWrite(value, super.searchField, () {
      super.searchField = value;
    });
  }

  final _$_IndexActorsStoreActionController =
      ActionController(name: '_IndexActorsStore');

  @override
  void resetLoadedPages() {
    final _$actionInfo = _$_IndexActorsStoreActionController.startAction(
        name: '_IndexActorsStore.resetLoadedPages');
    try {
      return super.resetLoadedPages();
    } finally {
      _$_IndexActorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLimitPages(int limitPages) {
    final _$actionInfo = _$_IndexActorsStoreActionController.startAction(
        name: '_IndexActorsStore.setLimitPages');
    try {
      return super.setLimitPages(limitPages);
    } finally {
      _$_IndexActorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastQueryUrl(String lastQueryUrl) {
    final _$actionInfo = _$_IndexActorsStoreActionController.startAction(
        name: '_IndexActorsStore.setLastQueryUrl');
    try {
      return super.setLastQueryUrl(lastQueryUrl);
    } finally {
      _$_IndexActorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActors(List<Person> actors) {
    final _$actionInfo = _$_IndexActorsStoreActionController.startAction(
        name: '_IndexActorsStore.setActors');
    try {
      return super.setActors(actors);
    } finally {
      _$_IndexActorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addActors(List<Person> actors) {
    final _$actionInfo = _$_IndexActorsStoreActionController.startAction(
        name: '_IndexActorsStore.addActors');
    try {
      return super.addActors(actors);
    } finally {
      _$_IndexActorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchField(String searchField) {
    final _$actionInfo = _$_IndexActorsStoreActionController.startAction(
        name: '_IndexActorsStore.setSearchField');
    try {
      return super.setSearchField(searchField);
    } finally {
      _$_IndexActorsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadedPages: ${loadedPages},
limitPages: ${limitPages},
lastQueryUrl: ${lastQueryUrl},
searchField: ${searchField},
lastQueryUrlPage: ${lastQueryUrlPage}
    ''';
  }
}
