import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(32.0),
        color: Colors.black,
        child: ListView(
          children: [
            Row(
              children: [
                Text('A popular pick for you', style: TextStyle(
                  color: Colors.white
                ))
              ],
            )
          ],
        ),
      )
    );
  }
}