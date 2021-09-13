import 'package:movie_sky/app/movie/models/Genre.dart';
import 'package:movie_sky/config/config.dart';

class Movie {

  int? id;
  String? title;
  String? releaseDate;
  String posterImage = 'https://i.imgur.com/E0UnFcD.png';
  String? originalLanguage;
  String? originalTitle;
  int? rating;
  String? sinopse;
  List<Genre>? genres;

  Movie();

  factory Movie.fromMap(Map<dynamic, dynamic> movie) {
    Movie newMovie = Movie();

    newMovie.id = movie['id'];
    newMovie.title = movie['title'];
    newMovie.releaseDate = movie['release_date'].split('-')[0];
    if(movie['poster_path'] != null)
      newMovie.posterImage = '$IMAGE_BASE_URL${movie['poster_path']}';
    newMovie.rating = (movie['vote_average'] / 2).ceil();
    newMovie.sinopse = movie['overview'];
    newMovie.originalLanguage = movie['original_language'];
    newMovie.originalTitle = movie['original_title'];
    newMovie.genres = movie['genre_ids'].map<Genre>((id) {
      return Genre.fromId(id);
    }).toList();

    return newMovie;
  }

  @override
  String toString() {
    return '${this.title}';
  }

}