// category_tile.dart
import 'package:flutter/material.dart';
import 'package:news_app/models/category-model.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          category.CategoryName, // Capitalize category name
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
