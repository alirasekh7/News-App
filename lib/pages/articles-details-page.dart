// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              article.urlToImage.isNotEmpty
                  ? Image.network(article.urlToImage)
                  : SizedBox(height: 200, child: Placeholder()),
              SizedBox(height: 10),
              Text(
                article.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                article.description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _launchURL(context, article.url);
                },
                child: Text('Read Full Article'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(BuildContext context, String url) {
    if (Uri.tryParse(url)?.isAbsolute == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewContainer(url: url),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid URL')),
      );
    }
  }
}

class WebViewContainer extends StatefulWidget {
  final String url;

  const WebViewContainer({super.key, required this.url});

  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Article'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}