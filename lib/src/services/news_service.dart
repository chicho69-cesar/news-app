import 'package:flutter/material.dart';

import 'package:news_app/src/models/news_models.dart';

class NewsService extends ChangeNotifier {
  List<Article> headLines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() {
    print('loading');
  }
}
