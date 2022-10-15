import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/widgets/news_list.dart';
import 'package:news_app/src/services/news_service.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: (newsService.headLines.isEmpty) 
        ? Center(child: CircularProgressIndicator(color: myTheme.primaryColor,))
        : NewsList(newsService.headLines),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
