import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter_newsapp/cubits/fetch_news_cubit/fetch_news_cubit.dart';
import 'package:iti_flutter_newsapp/pages/on_boarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchNewsCubit(),
      child: const MaterialApp(home: OnBoarding()),
    );
  }
}
