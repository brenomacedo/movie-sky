import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_sky/app/components/title_and_sub.dart';
import 'package:movie_sky/app/movie/components/actor_item.dart';
import 'package:movie_sky/app/movie/models/Genre.dart';
import 'package:movie_sky/app/movie/models/Movie.dart';

class ViewMovie extends StatelessWidget {

  final Movie movie;

  const ViewMovie({ Key? key, required this.movie }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: Modular.to.pop,
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
                SizedBox(
                  width: 170,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.star, color: Colors.white),
                        Text('Add to watchlist')
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movie.posterImage),
                  alignment: Alignment.center,
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(16)
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.red,
                    Colors.black
                  ]
                )
              ),
            ),
            SizedBox(height: 20),
            Text('${movie.title}', style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ), textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text('${movie.releaseDate}', style: GoogleFonts.ubuntu(
              color: Colors.grey[700],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ), textAlign: TextAlign.center),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...Iterable.generate(movie.rating ?? 0).map((e) {
                  return Icon(Icons.star, color: Colors.amber, size: 25);
                }).toList(),
                ...Iterable.generate(movie.rating != null ? 5 - movie.rating! : 0).map((e) {
                  return Icon(Icons.star, color: Colors.grey[700], size: 25);
                }).toList()
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: movie.genres!.asMap().entries.map((e) {

                int index = e.key;
                Genre genre = e.value;

                return Padding(
                  padding: EdgeInsets.only(left: index == movie.genres!.length ? 0 : 5),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text('${genre.name}', style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey[700]
                    ),
                  ),
                );
              }).toList()
            ),
            SizedBox(height: 28),
            TitleAndSub(
              title: 'Sinopse',
              subtitle: '${movie.sinopse}',
            ),
            SizedBox(height: 28),
            Text('Cast and crew', style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            )),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width - 48,
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ActorItem(),
                  SizedBox(width: 15),
                  ActorItem(),
                  SizedBox(width: 15),
                  ActorItem(),
                  SizedBox(width: 15),
                  ActorItem(),
                ],
              ),
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
      backgroundColor: Colors.black
    );
  }
}