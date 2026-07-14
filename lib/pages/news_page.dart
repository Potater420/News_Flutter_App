import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter_newsapp/cubits/fetch_news_cubit/fetch_news_cubit.dart';
import 'package:iti_flutter_newsapp/cubits/fetch_news_cubit/fetch_news_state.dart';
import 'package:iti_flutter_newsapp/pages/loading_screen.dart';
import 'package:iti_flutter_newsapp/pages/news_site_page.dart';
import 'package:iti_flutter_newsapp/widgets/category_card.dart';
import 'package:iti_flutter_newsapp/widgets/news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<String> categories = [
    'General',
    'Technology',
    'Sports',
    'Money',
    'Health',
  ];

  String currentCategory = 'General';

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
                    BlocProvider.of<FetchNewsCubit>(
                      context,
                    ).fetchNews(category: currentCategory);
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
            child: BlocBuilder<FetchNewsCubit,FetchNewsState>(
              builder: (context, state) {
                if (state is FetchNewsLoading) {
                  return const LoadingScreen();
                } else if (state is FetchNewsSuccess) {
                  return ListView.builder(
                    itemCount: BlocProvider.of<FetchNewsCubit>(
                      context,
                    ).newsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NewsSitePage(
                                  url:
                                      BlocProvider.of<FetchNewsCubit>(
                                        context,
                                      ).newsList[index]['url'] ??
                                      'https://www.bbc.com/news',
                                );
                              },
                            ),
                          );
                        },
                        child: NewsCard(
                          title:
                              BlocProvider.of<FetchNewsCubit>(
                                context,
                              ).newsList[index]['title'] ??
                              '',
                          description:
                              BlocProvider.of<FetchNewsCubit>(
                                context,
                              ).newsList[index]['description'] ??
                              '',
                          imageURL:
                              BlocProvider.of<FetchNewsCubit>(
                                context,
                              ).newsList[index]['urlToImage'] ??
                              'https://picsum.photos/300/200',
                        ),
                      );
                    },
                  );
                }
                return const Text('Failed loading');
              },
            ),
          ),
        ],
      ),
    );
  }
}


// ListView.builder(
//                     itemCount: fetchedList.length,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return NewsSitePage(
//                                   url:
//                                       fetchedList[index]['url'] ??
//                                       'https://www.bbc.com/news',
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: NewsCard(
//                           title: fetchedList[index]['title'] ?? '',
//                           description: fetchedList[index]['description'] ?? '',
//                           imageURL:
//                               fetchedList[index]['urlToImage'] ??
//                               'https://picsum.photos/300/200',
//                         ),
//                       );
//                     },
//                   ),