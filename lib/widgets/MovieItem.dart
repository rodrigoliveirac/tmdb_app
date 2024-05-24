import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieItem extends StatelessWidget {
  final String img;
  final String title;
  final int movieId;
  final void Function(int) onMovieDetails;

  const MovieItem({super.key,
    required this.img,
    required this.title,
    required this.movieId,
    required this.onMovieDetails
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onMovieDetails(movieId),
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                      color: Colors.grey[300],
                      height: double.infinity,
                      width: double.infinity,
                      child: const Center(
                          widthFactor: double.infinity,
                          heightFactor: double.infinity))),
              FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage, image: img, fit: BoxFit.fill)
            ],
          )),
    );
  }
}

final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
  0x42,
  0x60,
  0x82,
]);
