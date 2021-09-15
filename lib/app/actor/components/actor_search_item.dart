import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_sky/app/actor/models/Person.dart';

class ActorSearchItem extends StatelessWidget {
  final Person actor;

  const ActorSearchItem({ Key? key, required this.actor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 180
          ),
          Positioned(
            top: 15,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width - 48,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8)
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 150,
            child: Container(
              width: 150,
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${actor.name}', style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 20
                  )),
                  SizedBox(height: 10),
                  Text('Gender: ${actor.gender}', style: GoogleFonts.ubuntu(
                    color: Colors.grey[700],
                    fontSize: 16
                  ))
                ],
              ),
            ),
          ),
          Positioned(
            left: 15,
            child: Container(
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(actor.profilePic),
                  fit: BoxFit.cover,
                  alignment: Alignment.center
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}