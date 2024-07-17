import 'package:flutter/material.dart';
import 'package:news_app/pages/articles-details-page.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/models/category-model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/pages/category-page.dart';
import 'dart:convert';
import 'category-tile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  final List<Category> categories = Category.getCategory();

  @override
  void initState() {
    super.initState();
    fetchTopHeadlines();
  }

  Future<void> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=9ddfbc343026486898092b5cfe788cfd'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['articles'];
      setState(() {
        articles = jsonResponse.map((article) => Article.fromJson(article)).toList();
      });
    } else {
      throw Exception('Failed to load articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "Ali's News App",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            // Category Tiles
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPage(category: categories[index].CategoryName),
                        ),
                      );
                    },
                    child: CategoryTile(
                      category: categories[index],
                    ),
                  );
                },
              ),
            ),
            Divider(),
            // Articles
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(article.title),
                        subtitle: Text(article.description ?? ''),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleDetailPage(article: article),
                            ),
                          );
                        },
                      ),
                      Divider(), // Divider between articles
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
