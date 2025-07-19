import 'package:flutter/material.dart';
import 'plant_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> categories = ["Indoor", "Outdoor", "Succulents", "Herbs"];
  final List<String> plants = [
    "Aloe Vera",
    "Peace Lily",
    "Snake Plant",
    "Rose",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Store"),
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.shopping_cart)],
      ),
      body: Container(
        // 1️⃣ Background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imges/9044239.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        // 2️⃣ Your existing UI overlaid
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search plants...",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white70,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              // Categories
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Chip(label: Text(categories[index])),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Plant List
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: plants.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              PlantDetailScreen(plantName: plants[index]),
                        ),
                      );
                    },
                    child: Container(
                      width: 160,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/imges/beautiful-bicolor-plant-details.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            plants[index],
                            style: TextStyle(
                              color: const Color.fromARGB(255, 123, 227, 4),
                              fontWeight: FontWeight.bold,
                              backgroundColor: const Color.fromARGB(
                                115,
                                0,
                                0,
                                0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
