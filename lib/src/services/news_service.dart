import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';

class NewsService extends ChangeNotifier {
  final String _urlNews = 'newsapi.org';
  final String _apiKey = '2bf32e0adb7a40bda1d43dfe69691f16';

  String _selectedCategory = 'business';

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

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    
    for (var item in categories) { 
      categoryArticles[item.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get getArticlesOfSelectedCategory => categoryArticles[selectedCategory] ?? [];

  getTopHeadlines() async {
    const endpoint = 'v2/top-headlines';
    final url = Uri.https(_urlNews, endpoint, {
      'apiKey' : _apiKey, 
      'country': 'mx'
    });
    final response = await http.get(url);

    final newsResponse = NewsResponse.fromJson(response.body);
    headLines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }

    const endpoint = 'v2/top-headlines';
    final url = Uri.https(_urlNews, endpoint, {
      'apiKey'  : _apiKey, 
      'country' : 'mx', 
      'category': category
    });
    final response = await http.get(url);

    final newsResponse = NewsResponse.fromJson(response.body);
    categoryArticles[category]?.addAll(newsResponse.articles);
    notifyListeners();
  }
}
