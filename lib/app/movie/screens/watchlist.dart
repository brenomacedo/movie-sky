import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/movie/components/watch_list_movie.dart';

class WatchList extends StatelessWidget {
  const WatchList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Modular.to.pop();
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            WatchListMovie(),
            WatchListMovie(),
            WatchListMovie(),
            WatchListMovie(),
            WatchListMovie(),
            WatchListMovie(),
            WatchListMovie(),
          ],
        ),
      ),
      backgroundColor: Colors.black
    );
  }
}