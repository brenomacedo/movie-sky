import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_sky/app/components/title_and_sub.dart';
import 'package:movie_sky/app/movie/components/actor_item.dart';

class ViewMovie extends StatelessWidget {
  const ViewMovie({ Key? key }) : super(key: key);

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
                  onPressed: () {},
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
                  image: NetworkImage('https://image.tmdb.org/t/p/original/wjQXZTlFM3PVEUmKf1sUajjygqT.jpg'),
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
            Text('Deadpool', style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ), textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text('2018', style: GoogleFonts.ubuntu(
              color: Colors.grey[700],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ), textAlign: TextAlign.center),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.grey[700]),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text('Thriler', style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[700]
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text('Thriler', style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[700]
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text('Thriler', style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[700]
                  ),
                )
              ]
            ),
            SizedBox(height: 28),
            TitleAndSub(
              title: 'Sinopse',
              subtitle: 'Evan McCauley has skills he never learned and memories of places he has never visited. Self-medicated and on the brink of a mental breakdown, a secret group that call themselves “Infinites” come to his rescue, revealing that his memories are real',
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