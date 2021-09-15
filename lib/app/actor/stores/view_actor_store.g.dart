// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_actor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViewActorStore on _ViewActorStore, Store {
  final _$statusAtom = Atom(name: '_ViewActorStore.status');

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

  final _$actorAtom = Atom(name: '_ViewActorStore.actor');

  @override
  Person? get actor {
    _$actorAtom.reportRead();
    return super.actor;
  }

  @override
  set actor(Person? value) {
    _$actorAtom.reportWrite(value, super.actor, () {
      super.actor = value;
    });
  }

  final _$_ViewActorStoreActionController =
      ActionController(name: '_ViewActorStore');

  @override
  void setStatus(Status status) {
    final _$actionInfo = _$_ViewActorStoreActionController.startAction(
        name: '_ViewActorStore.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$_ViewActorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActor(Person actor) {
    final _$actionInfo = _$_ViewActorStoreActionController.startAction(
        name: '_ViewActorStore.setActor');
    try {
      return super.setActor(actor);
    } finally {
      _$_ViewActorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
actor: ${actor}
    ''';
  }
}
