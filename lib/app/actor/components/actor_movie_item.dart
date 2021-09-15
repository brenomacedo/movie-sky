import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/movie/models/Movie.dart';

class ActorMovieItem extends StatelessWidget {

  final Movie movie;

  const ActorMovieItem({ Key? key, required this.movie }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/movie/${movie.id}', arguments: movie);
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(movie.posterImage),
                alignment: Alignment.center,
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(8)
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 80,
            child: Text('${movie.title}', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ), textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}