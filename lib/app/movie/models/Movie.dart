import 'package:movie_sky/config/config.dart';

class Movie {

  String? title;
  String? releaseDate;
  String? posterImage;
  int? rating;
  String? sinopse;

  Movie();

  factory Movie.fromMap(Map<dynamic, dynamic> movie) {
    Movie newMovie = Movie();

    newMovie.title = movie['title'];
    newMovie.releaseDate = movie['release_date'];
    newMovie.posterImage = '$IMAGE_BASE_URL${movie['backdrop_path']}';
    newMovie.rating = (movie['vote_average'] / 2).ceil();
    newMovie.sinopse = movie['overview'];

    return newMovie;
  }

}