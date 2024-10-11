import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:restaurant_app/components/star.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Welcome> futureRestaurants;

  Future<Welcome> loadRestaurants() async {
    final String response =
        await rootBundle.loadString('assets/local_restaurant.json');
    return welcomeFromJson(response);
  }

  @override
  void initState() {
    super.initState();
    futureRestaurants = loadRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder<Welcome>(
          future: futureRestaurants,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final restaurants = snapshot.data!.restaurants;
              return ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Card(
                    color: Colors.white,
                    elevation: 3,
                    child: ListTile(
                      title: Text(restaurant.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(restaurant.city),
                          Row(
                            children: [
                              Star(rating: restaurant.rating),
                              SizedBox(width: 10),
                              Text(restaurant.rating.toString()),
                            ],
                          ),
                        ],
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Hero(
                          tag: restaurant.pictureId,
                          child: Image.network(
                            restaurant.pictureId,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: Colors.grey,
                              width: 60,
                              height: 60,
                              child: Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(restaurant: restaurant),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('No data found'));
            }
          },
        ),
      ),
    );
  }
}
