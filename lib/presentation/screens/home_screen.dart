import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/article_cubit/article_cubit.dart';
import 'package:flutter_application_1/constants/strings.dart';
import 'package:flutter_application_1/data/repo/article_repo.dart';
import 'package:flutter_application_1/data/service/article_service.dart';
import 'package:flutter_application_1/presentation/screens/general_news_screen.dart';

import 'package:flutter_application_1/presentation/screens/sports_news_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List myList = [
    BlocProvider(
      create: (context) =>
          ArticleCubit(ArticleRepo(ArticleService()))..getArticles('general'),
      child: const GeneralNews(),
    ),
    BlocProvider(
      create: (context) =>
          ArticleCubit(ArticleRepo(ArticleService()))..getArticles('sports'),
      child: const SportsNews(),
    ),
    BlocProvider(
      create: (context) => ArticleCubit(ArticleRepo(ArticleService()))
        ..getArticles('technology'),
      child: const SportsNews(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            bottom: TabBar(
              padding: const EdgeInsets.all(10),
                labelColor: Colors.white,
                unselectedLabelColor: const Color.fromARGB(255, 76, 92, 134),
                indicatorColor: Theme.of(context).scaffoldBackgroundColor, 
                controller: tabController,
                tabs: const [
                  Text('General', style: TextStyle(fontSize: 18)),
                  Text(
                    'Sports',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text('Technology', style: TextStyle(fontSize: 18)),
                ]),
            centerTitle: true,
            title: Text(
              'News ',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, searchScreen);
                  },
                  icon:
                      Icon(Icons.search, color: Theme.of(context).primaryColor))
            ],
            leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, color: Theme.of(context).primaryColor)),
          ),
        ),
        extendBodyBehindAppBar: false,
        body: TabBarView(controller: tabController, children: [
          myList[0],
          myList[1],
          myList[2],
        ]));
  }
}
