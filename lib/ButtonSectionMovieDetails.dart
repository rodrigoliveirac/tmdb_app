import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ButtonSectionMovieDetails extends StatelessWidget {
  const ButtonSectionMovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.list,
            label: 'ADD TO LIST',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.favorite_border,
            label: 'MARK AS FAVORITE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.bookmark_border,
            label: 'ADD TO WATCHLIST',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class ShimmerButtonSection extends StatelessWidget {
  const ShimmerButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 32, top: 16, right: 32, bottom: 16),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
              color: Colors.grey[300],
              height: 80,
              width: double.infinity,
              child:
                  const Center(heightFactor: 16, widthFactor: double.infinity)),
        ));
  }
}
