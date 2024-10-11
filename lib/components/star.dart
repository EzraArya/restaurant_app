import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final double rating;
  final int maxRating;
  final Color color;

  const Star({
    Key? key,
    required this.rating,
    this.maxRating = 5,
    this.color = Colors.amber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = maxRating - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star, color: color));
    }

    if (hasHalfStar) {
      stars.add(Icon(Icons.star_half, color: color));
    }

    for (int i = 0; i < emptyStars; i++) {
      stars.add(Icon(Icons.star_border, color: color));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
