import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../movies/widgets/MovieItem.dart';

class ActorItem extends StatelessWidget {
  final String? img;
  final String name;

  const ActorItem({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            (img == null)
                ?  const Center(
                widthFactor: double.infinity,
                heightFactor: double.infinity)
                : FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: img!,
                    fit: BoxFit.fill)
          ],
        ));
  }
}
