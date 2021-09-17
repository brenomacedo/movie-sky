import 'package:cloud_firestore/cloud_firestore.dart';

class MovieToWatch {

  int? id;
  String? title;
  String? image;

  MovieToWatch();

  factory MovieToWatch.fromDocument(DocumentSnapshot movie) {

    MovieToWatch newMovie = MovieToWatch();

    newMovie.id = movie['id'];
    newMovie.image = movie['image'];
    newMovie.title = movie['title'];

    return newMovie;

  }

  @override
  String toString() {
    return '${this.title}';
  }

}