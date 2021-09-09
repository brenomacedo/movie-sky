import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_sky/app/movie/components/MovieItem.dart';

class IndexMovies extends StatefulWidget {
  const IndexMovies({ Key? key }) : super(key: key);

  @override
  _IndexMoviesState createState() => _IndexMoviesState();
}

class _IndexMoviesState extends State<IndexMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        color: Colors.black,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('A popular pick for you', style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: IconButton(icon: Icon(Icons.search, color: Colors.white, size: 25), onPressed: () {}),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://image.tmdb.org/t/p/original/wjQXZTlFM3PVEUmKf1sUajjygqT.jpg'),
                      alignment: Alignment.center,
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.6
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Joker (2019)', style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )),
                      SizedBox(height: 5),
                      Text('Crime, Drama, Thriller', style: GoogleFonts.ubuntu(
                        color: Colors.grey[700]
                      )),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 25),
                          Icon(Icons.star, color: Colors.amber, size: 25),
                          Icon(Icons.star, color: Colors.amber, size: 25),
                          Icon(Icons.star, color: Colors.amber, size: 25),
                          Icon(Icons.star, color: Colors.grey[700], size: 25),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('Original language: EN', style: GoogleFonts.ubuntu(
                        color: Colors.white
                      ))
                    ],
                  ),
                )
              ],
            ),
            Text('Suggested for you', style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            )),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width - 48,
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Thriller', style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Thriller', style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Thriller', style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Thriller', style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Thriller', style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Thriller', style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            MovieItem(),
            SizedBox(height: 15),
            MovieItem(),
            SizedBox(height: 15),
            MovieItem(),
            SizedBox(height: 15),
            MovieItem(),
            SizedBox(height: 15),
            MovieItem(),
          ],
        ),
      )
    );
  }
}