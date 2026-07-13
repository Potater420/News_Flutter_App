import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageURL,
  });

  final String title;
  final String description;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      color: Colors.white,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.network(imageURL),
          ),

          const SizedBox(
            height: 10,
          ),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.black38),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
