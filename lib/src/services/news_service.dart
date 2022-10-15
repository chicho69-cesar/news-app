import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;

import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';

class NewsService extends ChangeNotifier {
  final String _urlNews = 'newsapi.org';
  final String _apiKey = '2bf32e0adb7a40bda1d43dfe69691f16';
  
  List<Article> headLines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.football, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology')
  ];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    const endpoint = 'v2/top-headlines';
    final url = Uri.https(_urlNews, endpoint, {
      'apiKey': _apiKey,
      'country': 'mx'
    });
    /* final response = await http.get(url);

    final newsResponse = NewsResponse.fromJson(response.body);
    headLines.addAll(newsResponse.articles);
    notifyListeners(); */
  }
}
