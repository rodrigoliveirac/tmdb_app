import 'package:flutter/material.dart';
import 'package:tmdb_app/api_key.dart';

class MovieItem extends StatelessWidget {
  final String img;
  final String title;
  final String description;

  const MovieItem(
      {super.key,
      required this.img,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Image.network( img, fit: BoxFit.fill));
  }
}
