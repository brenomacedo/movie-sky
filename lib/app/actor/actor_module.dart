import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/actor/screens/index_actors.dart';

class ActorModule extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => IndexActors())
  ];

}