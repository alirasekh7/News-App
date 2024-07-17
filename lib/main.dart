import 'package:flutter/material.dart';
import 'package:news_app/home-screen.dart';
import 'package:news_app/api-service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
     