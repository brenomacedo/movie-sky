import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/actor/screens/index_actors.dart';
import 'package:movie_sky/app/actor/screens/view_actor.dart';
import 'package:movie_sky/app/actor/stores/index_actor_store.dart';
import 'package:movie_sky/app/actor/stores/view_actor_store.dart';

class ActorModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => IndexActorsStore()),
    Bind.singleton((i) => ViewActorStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => IndexActors()),
    ChildRoute('/:id', child: (_, args) => ViewActor(actorId: int.parse(args.params['id'])))
  ];

}