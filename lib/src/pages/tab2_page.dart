import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const <Widget>[
            Expanded(child: _CategoryList()),
          ],
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final cName = categories[index].name;

        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              _CategoryButton(categories[index]),
              const SizedBox(height: 5),
              Text('${ cName[0].toUpperCase() }${ cName.substring(1) }')
            ],
          ),
        );
      },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(category.name);
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(category.icon, color: Colors.black54,),
      ),
    );
  }
}
