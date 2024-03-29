import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_sky/app/auth/stores/auth_store.dart';
import 'package:movie_sky/app/movie/components/movie_item.dart';
import 'package:movie_sky/app/movie/models/Genre.dart';
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';

class IndexMovies extends StatefulWidget {
  const IndexMovies({ Key? key }) : super(key: key);

  @override
  _IndexMoviesState createState() => _IndexMoviesState();
}

class _IndexMoviesState extends State<IndexMovies> {

  final indexMoviesStore = Modular.get<IndexMoviesStore>();
  final authStore = Modular.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: authStore.user != null ? FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Modular.to.pushNamed('/movie/watchlist');
        },
        child: Icon(Icons.list)
      ) : null,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                  child: Observer(builder: (_) {
                    return IconButton(icon: Icon(indexMoviesStore.showSearchbar
                      ? Icons.close
                      : Icons.search,
                      color: Colors.white, size: 25),
                      onPressed: indexMoviesStore.toggleSearchBar);
                  }),
                ),
              ],
            ),
            Observer(builder: (_) {
              if(indexMoviesStore.showSearchbar)
                return Row(
                  children: [
                    Expanded(child: TextField(
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 20
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search a film',
                        hintStyle: GoogleFonts.ubuntu(
                          color: Colors.grey[700],
                          fontSize: 20,
                          decorationColor: Colors.red
                        )
                      ),
                      onChanged: (text) => indexMoviesStore.setSearchField(text),
                    )),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: ElevatedButton(
                          onPressed: () async {
                            Response response = await indexMoviesStore.searchMovieByName();

                            if(response == Response.ERROR) {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return Dialog(
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      child: Text('No movies found :(', style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      )),
                                      color: Colors.red,
                                    ),
                                  );
                                }
                              );
                            }
                          },
                          child: Icon(Icons.search),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size.zero),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            backgroundColor: MaterialStateProperty.all(Colors.red)
                          ),
                        ),
                      ),
                    )
                  ],
                );

              return SizedBox();
            }),
            Observer(builder: (_) {
              if(indexMoviesStore.showSearchbar)
                return SizedBox(height: 15);

              return SizedBox();
            }),
            Observer(
              builder: (_) {

                if(indexMoviesStore.status == Status.LOADING)
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );

                return GestureDetector(
                  onTap: () {
                    Modular.to.pushNamed(
                      '/movie/${indexMoviesStore.popularPick?.id}',
                      arguments: indexMoviesStore.popularPick
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('${indexMoviesStore.popularPick?.posterImage}'),
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
                            Text('${indexMoviesStore.popularPick?.title} (${indexMoviesStore.popularPick?.releaseDate})', style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            )),
                            SizedBox(height: 5),
                            Text.rich(TextSpan(
                              style: TextStyle(
                                color: Colors.grey[700]
                              ),
                              children: indexMoviesStore.popularPick?.genres?.asMap().entries.map((entry) {
                      
                                int idx = entry.key;
                                Genre val = entry.value;
                      
                                return TextSpan(
                                  text: indexMoviesStore.popularPick?.genres?.length == idx + 1 ? '${val.name}' : '${val.name}, '
                                );
                              }).toList()
                            )),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                ...Iterable.generate(indexMoviesStore.popularPick?.rating ?? 0).map((e) {
                                  return Icon(Icons.star, color: Colors.amber, size: 25);
                                }).toList(),
                                ...Iterable.generate(indexMoviesStore.popularPick?.rating != null ? 5 - indexMoviesStore.popularPick!.rating! : 0).map((e) {
                                  return Icon(Icons.star, color: Colors.grey[700], size: 25);
                                }).toList()
                              ],
                            ),
                            SizedBox(height: 5),
                            Text('Original language: ${indexMoviesStore.popularPick?.originalLanguage?.toUpperCase()}', style: GoogleFonts.ubuntu(
                              color: Colors.white
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/actor'),
              child: Text('Search for actors', style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.bold
              )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)
              ),
            ),
            SizedBox(height: 15),
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
                children: Genre.genres.asMap().entries.map<Widget>((e) {

                  int key = e.key;
                  Genre genre = e.value;

                  return Padding(
                    padding: EdgeInsets.only(right: key + 1 == Genre.genres.length ? 0 : 5),
                    child: ElevatedButton(
                      onPressed: () => indexMoviesStore.searchByGenre(genre.id ?? 0),
                      child: Text('${genre.name}', style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      )),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 15),
            Observer(
              builder: (_) {
                return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: indexMoviesStore.popularMovies.map((movie) {
                    return MovieItem(movie: movie);
                  }).toList(),
                );
              }
            ),
            Observer(
              builder: (_) {

                if(!indexMoviesStore.loadedAll) {
                  indexMoviesStore.loadMoreMovies();
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.red
                    )
                  );
                }

                return SizedBox();
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}