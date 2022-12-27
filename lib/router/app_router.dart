import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/article_cubit/article_cubit.dart';

import 'package:flutter_application_1/constants/strings.dart';
import 'package:flutter_application_1/data/model/article_model.dart';
import 'package:flutter_application_1/data/repo/article_repo.dart';
import 'package:flutter_application_1/data/service/article_service.dart';
import 'package:flutter_application_1/presentation/screens/article_details_screen.dart';
import 'package:flutter_application_1/presentation/screens/general_news_screen.dart';
import 'package:flutter_application_1/presentation/screens/search_screen.dart';
import 'package:flutter_application_1/presentation/screens/sports_news_screen.dart';

import 'package:flutter_application_1/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late ArticleCubit articleCubit;
  AppRouter() {
    articleCubit = ArticleCubit(ArticleRepo(ArticleService()));
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));
      case articleDetailsScreen:
        final articles = settings.arguments as Articles;
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => ArticleCubit(ArticleRepo(ArticleService())),
                  child: ArticleDetails(articles: articles),
                )));
      case sportsNews:
        return MaterialPageRoute(builder: ((context) => const SportsNews()));
      case generalNews:
        return MaterialPageRoute(builder: (context) {
          return const GeneralNews();
        });
      case searchScreen:
        return MaterialPageRoute(builder: ((context) => const SearchScreen()));
    }
    return null;
  }
}
