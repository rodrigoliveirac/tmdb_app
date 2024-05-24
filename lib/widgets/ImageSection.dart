import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'MovieItem.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
                color: Colors.grey[300],
                height: 240,
                width: 600,
                child: const Center(heightFactor: 240, widthFactor: 600))),
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          width: 600,
          height: 240,
          fit: BoxFit.cover,
          image: image,
        )
      ],
    );
  }
}
