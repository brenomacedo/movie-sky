import 'package:movie_sky/app/movie/models/Genre.dart';
import 'package:movie_sky/config/config.dart';

class Movie {

  String? title;
  String? releaseDate;
  String? posterImage;
  int? rating;
  String? sinopse;
  List<Genre>? genres;

  Movie();

  factory Movie.fromMap(Map<dynamic, dynamic> movie) {
    Movie newMovie = Movie();

    newMovie.title = movie['title'];
    newMovie.releaseDate = movie['release_date'].split('-')[0];
    newMovie.posterImage = '$IMAGE_BASE_URL${movie['backdrop_path']}';
    newMovie.rating = (movie['vote_average'] / 2).ceil();
    newMovie.sinopse = movie['overview'];
    newMovie.genres = movie['genre_ids'].map((id) {
      return Genre.fromId(id);
    }).toList();

    return newMovie;
  }

  @override
  String toString() {
    return '${this.title}';
  }

}