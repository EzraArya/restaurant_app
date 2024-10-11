import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  const DetailScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(restaurant.pictureId),
                ), // Assuming pictureId is a URL
                SizedBox(height: 10),
                Text(
                  restaurant.description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'City: ${restaurant.city}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Rating: ${restaurant.rating}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Foods:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Column(
                  children: restaurant.menus.foods.map((food) {
                    return Text('- ${food.name}');
                  }).toList(),
                ),
                SizedBox(height: 10),
                Text(
                  'Drinks:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Column(
                  children: restaurant.menus.drinks.map((drink) {
                    return Text('- ${drink.name}');
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
