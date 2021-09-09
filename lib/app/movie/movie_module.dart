import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/movie/screens/IndexMovies.dart';

class MovieModule extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => IndexMovies())
  ];

}