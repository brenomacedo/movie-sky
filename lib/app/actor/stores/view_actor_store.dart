import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:movie_sky/app/actor/models/Person.dart';
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';
import 'package:http/http.dart' as http;
import 'package:movie_sky/config/config.dart';

part 'view_actor_store.g.dart';

class ViewActorStore = _ViewActorStore with _$ViewActorStore; 

abstract class _ViewActorStore with Store {

  void getActor(int actorId) async {

    http.Response response = await http.get(Uri.parse('$BASE_URL/person/$actorId?api_key=$API_KEY'));
    Map<String, dynamic> actor = jsonDecode(response.body);

    Person newActor = Person.fromMap(actor);

    setActor(newActor);

    setStatus(Status.IDLE);

  }

  @observable
  Status status = Status.LOADING;

  @action
  void setStatus(Status status) {
    this.status = status;
  }

  @observable
  Person? actor;

  @action
  void setActor(Person actor) {
    this.actor = actor;
  }

}