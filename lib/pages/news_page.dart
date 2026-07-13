import 'package:flutter/material.dart';
import 'package:iti_flutter_newsapp/pages/loading_screen.dart';
import 'package:iti_flutter_newsapp/services/fetch_news_services.dart';
import 'package:iti_flutter_newsapp/widgets/category_card.dart';
import 'package:iti_flutter_newsapp/widgets/news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool isLoading = false;

  final List<String> categories = [
    'General',
    'Technology',
    'Sports',
    'Money',
    'Health',
  ];

  List<dynamic> fetchedList = []; // var fetchedList = [] ???

  String currentCategory = 'General';

  void fetchNews({required String selectedCategory}) async {
    isLoading = true;
    setState(() {});
    FetchNewsServices fetchNewsServices = FetchNewsServices();
    fetchedList = await fetchNewsServices.newsList(category: selectedCategory);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchNews(selectedCategory: currentCategory);
  }

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
                    fetchNews(selectedCategory: currentCategory);
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
            child: isLoading
                ? const LoadingScreen()
                : ListView.builder(
                    itemCount: fetchedList.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        title: fetchedList[index]['title'] ?? '',
                        description: fetchedList[index]['description'] ?? '',
                        imageURL:
                            fetchedList[index]['urlToImage'] ??
                            'https://picsum.photos/300/200',
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
