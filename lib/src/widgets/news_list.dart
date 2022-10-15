import 'package:flutter/material.dart';

import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.news, {super.key});

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return _New(
          newsItem: news[index], 
          index: index
        );
      },
    );
  }
}

class _New extends StatelessWidget {
  const _New({required this.newsItem, required this.index});
  
  final Article newsItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(newsItem: newsItem, index: index),
        _CardTitle(newsItem),
        _CardImage(newsItem)
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {
  const _CardTopBar({
    required this.newsItem, required this.index,
  });

  final Article newsItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${ index + 1 }. ', style: TextStyle(color: myTheme.primaryColor)),
          Text('${ newsItem.source.name }. ')
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle(this.newsItem);

  final Article newsItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        newsItem.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage(this.newsItem);
  
  final Article newsItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello World'),
    );
  }
}
