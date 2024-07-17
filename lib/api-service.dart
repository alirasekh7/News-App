import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/articles.dart';

class ApiService {
  static const String apiKey = '9ddfbc343026486898092b5cfe788cfd';
  static const String baseUrl = 'https://newsapi.org/v2/top-headlines';

  static Future<List<Article>> fetchArticlesByCategory(String category) async {
    final response = await http.get(Uri.parse('$baseUrl?category=$category&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      List<Article> articles = [];
      var data = json.decode(response.body)['articles'];
      for (var item in data) {
        articles.add(Article.fromJson(item));
      }
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
