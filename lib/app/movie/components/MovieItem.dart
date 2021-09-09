import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
          width: 80,
          height: 120,
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Deadpool (2016)', style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
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
          ],
        )
      ],
    );
  }
}