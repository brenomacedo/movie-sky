// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$statusAtom = Atom(name: '_AuthStore.status');

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

  final _$userAtom = Atom(name: '_AuthStore.user');

  @override
  AppUser? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(AppUser? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void setStatus(Status status) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(AppUser? user) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
user: ${user}
    ''';
  }
}
