import 'package:flutter/material.dart';

class ActorItem extends StatelessWidget {
  const ActorItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/original/wjQXZTlFM3PVEUmKf1sUajjygqT.jpg'),
              alignment: Alignment.center,
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(8)
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 80,
          child: Text('Tom Cruise', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ), textAlign: TextAlign.center),
        )
      ],
    );
  }
}