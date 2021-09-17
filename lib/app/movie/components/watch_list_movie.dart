import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_sky/app/movie/models/MovieToWatch.dart';
import 'package:movie_sky/app/movie/stores/watchlist_store.dart';

class WatchListMovie extends StatelessWidget {
  WatchListMovie({ Key? key, required this.movie }) : super(key: key);

  final MovieToWatch movie;

  final WatchListStore watchListStore = Modular.get<WatchListStore>();

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${movie.image}')
              )
            )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('${movie.title}', style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              )),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              width: 55,
              height: 55,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
                child: Icon(Icons.delete),
                onPressed: () {
                  watchListStore.deleteMovie(movie);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}