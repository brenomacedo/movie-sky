import 'package:flutter/material.dart';
import 'package:movie_sky/app/components/title_and_sub.dart';

class ViewActor extends StatelessWidget {
  const ViewActor({ Key? key }) : super(key: key);

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
                  width: 220,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Search movies with this actor'),
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
            TitleAndSub(
              title: 'Tom Cruise',
              subtitle: '02-15-2018',
            ),
            SizedBox(height: 15),
            TitleAndSub(
              title: 'Gender',
              subtitle: 'Male',
            ),
            SizedBox(height: 15),
            TitleAndSub(
              title: 'Place of birth',
              subtitle: 'New York - USA',
            ),
            SizedBox(height: 15),
            TitleAndSub(
              title: 'Biography',
              subtitle: 'An American actor and filmmaker. He has been nominated for three Academy Awards and has won three Golden Globe Awards. He started his career at age 19 in the 1981 film Endless Love. After portraying supporting roles in Taps (1981) and The Outsiders (1983), his first leading role was in Risky Business, released in August 1983. Cruise became a full-fledged movie star after starring as Pete \"Maverick\" Mitchell in Top Gun (1986). He has since 1996 been well known for his role as secret agent Ethan Hunt in the Mission: Impossible film series.  In 2012, Cruise was Hollywoods highest-paid actor. Fifteen of his films grossed over 100 million domestically; twenty-one have grossed in excess of 200 million worldwide. Cruise is known for his support for the Church of Scientology and its affiliated social programs',
            ),
            SizedBox(height: 28)
          ],
        ),
      ),
      backgroundColor: Colors.black
    );
  }
}