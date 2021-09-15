import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/actor/stores/view_actor_store.dart';
import 'package:movie_sky/app/components/title_and_sub.dart';
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';

class ViewActor extends StatelessWidget {

  final int actorId;

  ViewActor({ Key? key, required this.actorId }) : super(key: key);

  final viewActorStore = Modular.get<ViewActorStore>();

  @override
  Widget build(BuildContext context) {

    viewActorStore.getActor(actorId);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Observer(
          builder: (_) {

            if(viewActorStore.status == Status.IDLE)
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(viewActorStore.actor!.profilePic),
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
                    title: '${viewActorStore.actor?.name}',
                    subtitle: '${viewActorStore.actor?.lifeDays}',
                  ),
                  SizedBox(height: 15),
                  TitleAndSub(
                    title: 'Gender',
                    subtitle: '${viewActorStore.actor?.gender}',
                  ),
                  SizedBox(height: 15),
                  TitleAndSub(
                    title: 'Place of birth',
                    subtitle: '${viewActorStore.actor?.birthplace}',
                  ),
                  SizedBox(height: 15),
                  TitleAndSub(
                    title: 'Biography',
                    subtitle: '${viewActorStore.actor?.biography}',
                  ),
                  SizedBox(height: 28)
                ],
              );

            return Center(
              child: CircularProgressIndicator(color: Colors.red)
            );

          },
        ),
      ),
      backgroundColor: Colors.black
    );
  }
}