import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/models/articles.dart';
import 'package:news_app/pages/articles-details-page.dart';
class CategoryPage extends StatefulWidget {
  final String category;

  CategoryPage({required this.category});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    fetchCategoryArticles();
  }

  Future<void> fetchCategoryArticles() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=${widget.category.toLowerCase()}&apiKey=9ddfbc343026486898092b5cfe788cfd'));

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
        title: Text(widget.category),
      ),
      body: articles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
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
    );
  }
}
