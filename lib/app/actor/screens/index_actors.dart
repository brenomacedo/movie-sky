import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_sky/app/actor/components/actor_search_item.dart';
import 'package:movie_sky/app/actor/stores/index_actor_store.dart';
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';

class IndexActors extends StatelessWidget {
  IndexActors({ Key? key }) : super(key: key);

  final indexActorsStore = Modular.get<IndexActorsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.only(right: 16),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search an actor',
                      hintStyle: GoogleFonts.ubuntu(
                        color: Colors.grey[700],
                        fontSize: 20
                      ),
                      border: InputBorder.none
                    ),
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 20
                    ),
                    onChanged: (text) => indexActorsStore.setSearchField(text)
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: ElevatedButton(
                      onPressed: () async {
                        
                        Response response = await indexActorsStore.searchActorByName();

                        if(response == Response.ERROR) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text('No actors found :(', style: GoogleFonts.ubuntu(
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
                    )
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Observer(
              builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: indexActorsStore.actors.length,
                  itemBuilder: (_, index) {
                    return ActorSearchItem();
                  },
                );
              },
            ),
            Observer(
              builder: (_) {

                indexActorsStore.loadMoreMovies();

                return Center(
                  child: CircularProgressIndicator(color: Colors.red)
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