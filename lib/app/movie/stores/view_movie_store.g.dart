// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViewMovieStore on _ViewMovieStore, Store {
  final _$statusAtom = Atom(name: '_ViewMovieStore.status');

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

  final _$_ViewMovieStoreActionController =
      ActionController(name: '_ViewMovieStore');

  @override
  void setStatus(Status status) {
    final _$actionInfo = _$_ViewMovieStoreActionController.startAction(
        name: '_ViewMovieStore.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$_ViewMovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
