import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/auth/stores/auth_store.dart';
import 'package:movie_sky/app/movie/components/watch_list_movie.dart';
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';
import 'package:movie_sky/app/movie/stores/watchlist_store.dart';

class WatchList extends StatelessWidget {
  WatchList({ Key? key }) : super(key: key);
  
  final watchListStore = Modular.get<WatchListStore>();
  final authStore = Modular.get<AuthStore>();

  @override
  Widget build(BuildContext context) {

    watchListStore.getMovies();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          await authStore.logout();
          Modular.to.pushNamed('/auth/login');
        },
        child: Icon(Icons.logout)
      ),
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
            Observer(
              builder: (_) {
                if(watchListStore.status == Status.LOADING)
                  return Center(child: CircularProgressIndicator(color: Colors.red));

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: watchListStore.movies.length,
                  itemBuilder: (_, index) {
                    return WatchListMovie(movie: watchListStore.movies[index]);
                  },
                );
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.black
    );
  }
}