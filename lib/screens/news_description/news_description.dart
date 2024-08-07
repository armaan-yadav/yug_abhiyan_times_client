import 'package:flutter/material.dart';

class NewsDescription extends StatelessWidget {
  const NewsDescription({
    super.key,
    required this.newsData,
  });

  final Map<String, dynamic> newsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsData["categoryName"]),
      ),
    );
  }
}
