import 'package:flutter/material.dart';
import 'package:iti_flutter_newsapp/widgets/category_card.dart';
import 'package:iti_flutter_newsapp/widgets/news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<String> categories = [
    'Business',
    'Sports',
    'Technology',
    'Health',
    'Science',
  ];

  String currentCategory = 'Business';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News APP',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentCategory = categories[index];
                    });
                  },
                  child: CategoryCard(
                    category: categories[index],
                    isSelected: currentCategory == categories[index],
                  ),
                );
              },
            ),
          ),
          const Divider(
            thickness: 0.75,
            indent: 40,
            endIndent: 40,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return const NewsCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
