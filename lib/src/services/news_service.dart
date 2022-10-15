import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:news_app/src/models/news_models.dart';

class NewsService extends ChangeNotifier {
  final String _urlNews = 'newsapi.org';
  final String _apiKey = '2bf32e0adb7a40bda1d43dfe69691f16';
  List<Article> headLines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    const endpoint = 'v2/top-headlines';
    final url = Uri.https(_urlNews, endpoint, {
      'apiKey': _apiKey,
      'country': 'mx'
    });
    final response = await http.get(url);

    final newsResponse = NewsResponse.fromJson(response.body);
    headLines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
