import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final double rating; // The rating value (e.g., 4.5)
  final int maxRating; // Max number of stars, usually 5
  final Color color; // Optional: Color of the stars

  const Star({
    Key? key,
    required this.rating,
    this.maxRating = 5,
    this.color = Colors.amber, // Default star color is amber
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a list of star widgets
    List<Widget> stars = [];
    int fullStars = rating.floor(); // Number of full stars
    bool hasHalfStar =
        (rating - fullStars) >= 0.5; // Whether there is a half star
    int emptyStars =
        maxRating - fullStars - (hasHalfStar ? 1 : 0); // Remaining empty stars

    // Add full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star, color: color));
    }

    // Add half star if applicable
    if (hasHalfStar) {
      stars.add(Icon(Icons.star_half, color: color));
    }

    // Add empty stars
    for (int i = 0; i < emptyStars; i++) {
      stars.add(Icon(Icons.star_border, color: color));
    }

    // Return a row with all the stars
    return Row(
      mainAxisSize:
          MainAxisSize.min, // Ensure the row only takes up the space it needs
      children: stars,
    );
  }
}
