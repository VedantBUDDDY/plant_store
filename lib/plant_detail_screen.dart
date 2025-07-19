
import 'package:flutter/material.dart';
class PlantDetailScreen extends StatelessWidget {
  final String plantName;

  // ignore: use_key_in_widget_constructors
  const PlantDetailScreen({required this.plantName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Hero image
          Hero(
            tag: plantName,
            child: Image.asset("assets/imges/9044239.jpg",
              height: 300, width: double.infinity, fit: BoxFit.cover),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plantName, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.light_mode), Text("Medium Light"),
                    SizedBox(width: 16),
                    Icon(Icons.water_drop), Text("Twice a week"),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "This beautiful plant adds a touch of nature and calm to any space. Easy to care for and perfect for homes or offices.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}