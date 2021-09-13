import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/movie/screens/index_movies.dart';
import 'package:movie_sky/app/movie/screens/view_movie.dart';
import 'package:movie_sky/app/movie/stores/index_movies_stores.dart';

class MovieModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.singleton((i) => IndexMoviesStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => IndexMovies()),
    ChildRoute('/:id', child: (_, args) => ViewMovie(movie: args.data))
  ];

}