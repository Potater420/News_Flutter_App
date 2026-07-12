import 'package:flutter/material.dart';
import 'package:iti_flutter_newsapp/pages/on_boarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: OnBoarding());
  }
}
