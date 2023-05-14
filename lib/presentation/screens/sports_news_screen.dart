import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/article_cubit/article_cubit.dart';
import 'package:flutter_application_1/constants/strings.dart';
import 'package:flutter_application_1/presentation/widgets/breaking_news_container.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SportsNews extends StatelessWidget {
  const SportsNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          if (state is ArticlIsLoading) {
            return Center(
                child: LoadingAnimationWidget.hexagonDots(
                    color: Colors.white, size: 70));
          } else if (state is ArticlLoaded) {
            return SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 40, left: 40, top: 15),
                      child: Text(
                        'Braeking News',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.articles.length,
                        itemBuilder: ((context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, articleDetailsScreen,
                                    arguments: state.articles[index]);
                              },
                              child: BreakingNewsContainer(
                                index: index,
                                articles: state.articles,
                              ));
                        }))
                  ]),
            );
          }
          return const Text('Something Went Wrong');
        },
      ),
    );
  }
}
