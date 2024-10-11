import 'package:flutter/material.dart';
import 'package:restaurant_app/components/star.dart';
import 'package:restaurant_app/models/restaurant.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  const DetailScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(restaurant.name),
              background: Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                  restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    '${restaurant.city}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '${restaurant.rating}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Star(rating: restaurant.rating)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    restaurant.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 20),
                  Text(
                    'Foods:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final food = restaurant.menus.foods[index];
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(food.name)),
                    ),
                  );
                },
                childCount: restaurant.menus.foods.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Drinks:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final drink = restaurant.menus.drinks[index];
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(drink.name)),
                    ),
                  );
                },
                childCount: restaurant.menus.drinks.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
