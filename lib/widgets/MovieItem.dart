import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String img;
  final String title;
  final String description;

  const MovieItem({super.key, required this.img, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            child: SizedBox(
                child: Center(child: Text("$title $description"))
            )));
  }
}






