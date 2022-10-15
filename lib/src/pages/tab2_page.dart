import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/widgets/news_list.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  State<Tab2Page> createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const <Widget>[
            _CategoryList(),
            _NewsListOfCategory()
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final categories = newsService.categories;

    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
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
                Text(
                  '${ cName[0].toUpperCase() }${ cName.substring(1) }',
                  style: TextStyle(
                    color: newsService.selectedCategory == categories[index].name 
                      ? myTheme.primaryColor
                      : Colors.white,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NewsListOfCategory extends StatelessWidget {
  const _NewsListOfCategory({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    newsService.getArticlesByCategory(newsService.selectedCategory);
    
    return Expanded(
      child: newsService.getArticlesOfSelectedCategory.isEmpty
        ? Center(child: CircularProgressIndicator(color: myTheme.primaryColor,))
        : NewsList(newsService.getArticlesOfSelectedCategory),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon, 
          color: category.name == newsService.selectedCategory
            ? myTheme.primaryColor
            : Colors.black54,
        ),
      ),
    );
  }
}
