import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/actor/models/Person.dart';

class ActorItem extends StatelessWidget {

  final Person actor;

  const ActorItem({ Key? key, required this.actor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/actor/${actor.id}');
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(actor.profilePic),
                alignment: Alignment.center,
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(8)
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 80,
            child: Text('${actor.name}', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ), textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}