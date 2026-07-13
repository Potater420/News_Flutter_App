import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Lottie.asset(
            'assets/lottie/loading.json',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Expanded(
          child: Text(
            'Loading News...',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
