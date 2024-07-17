// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TvPage extends StatelessWidget {
  const TvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV'),
      ),
      body: Center(
        child: Text(
          'Welcome to the TV Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
