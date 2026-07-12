import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category,required this.isSelected, super.key});

  final String category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected? Colors.blue:Colors.grey.shade300,
        ),
        child: Center(
          child: Text(
            category,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
