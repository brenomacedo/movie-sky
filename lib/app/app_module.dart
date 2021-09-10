import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/actor/actor_module.dart';
import 'package:movie_sky/app/movie/movie_module.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/movie', module: MovieModule()),
    ModuleRoute('/actor', module: ActorModule())
  ];

}