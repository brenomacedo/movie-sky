import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_sky/app/movie/models/Genre.dart';
import 'package:movie_sky/app/movie/models/Movie.dart';

class MovieItem extends StatelessWidget {

  final Movie movie;

  const MovieItem({ Key? key, required this.movie }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/movie/${movie.id}', arguments: movie);
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${movie.posterImage}'),
                    alignment: Alignment.center,
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                width: 80,
                height: 120,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${movie.title} (${movie.releaseDate})', style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    )),
                    SizedBox(height: 5),
                    Text.rich(TextSpan(
                      style: TextStyle(
                        color: Colors.grey[700]
                      ),
                      children: movie.genres?.asMap().entries.map((entry) {
              
                        int idx = entry.key;
                        Genre val = entry.value;
              
                        return TextSpan(
                          text: movie.genres?.length == idx + 1 ? '${val.name}' : '${val.name}, '
                        );
                      }).toList()
                    )),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        ...Iterable.generate(movie.rating ?? 0).map((e) {
                          return Icon(Icons.star, color: Colors.amber, size: 25);
                        }).toList(),
                        ...Iterable.generate(movie.rating != null ? 5 - movie.rating! : 0).map((e) {
                          return Icon(Icons.star, color: Colors.grey[700], size: 25);
                        }).toList()
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}