import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_sky/app/actor/components/actor_search_item.dart';

class IndexActors extends StatelessWidget {
  const IndexActors({ Key? key }) : super(key: key);

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
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: ElevatedButton(
                      onPressed: () {},
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
            ActorSearchItem(),
            ActorSearchItem(),
            ActorSearchItem(),
            ActorSearchItem(),
            ActorSearchItem()
          ],
        ),
      ),
      backgroundColor: Colors.black
    );
  }
}