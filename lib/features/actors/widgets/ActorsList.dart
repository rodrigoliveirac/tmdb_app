import 'package:flutter/cupertino.dart';

import '../../../model/ActorModel.dart';
import 'ActorItem.dart';

class ActorsList extends StatelessWidget {
  final List<ActorModel> actors;
  const ActorsList({super.key, required this.actors});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(24.0),
      itemCount: actors.length,
      itemBuilder: (context, index) {
        return ActorItem(
          img: actors[index].img,
          name: actors[index].name
        );
      },
    );
  }
}
