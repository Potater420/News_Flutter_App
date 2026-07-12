import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

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
            child: Image.asset('assets/images/background pic.jpg'),
          ),

          const SizedBox(
            height: 10,
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HeLLoo',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "The view given in the picture is nice and there's alot i'd like ot  say but not enough time",
                  style: TextStyle(fontSize: 14, color: Colors.black38),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
