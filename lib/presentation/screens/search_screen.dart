import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/article_cubit/article_cubit.dart';
import 'package:flutter_application_1/constants/strings.dart';
import 'package:flutter_application_1/data/repo/article_repo.dart';
import 'package:flutter_application_1/data/service/article_service.dart';

import 'package:flutter_application_1/presentation/widgets/breaking_news_container.dart';
import 'package:flutter_application_1/presentation/widgets/no_search.dart';
import 'package:flutter_application_1/presentation/widgets/search_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ArticleCubit(ArticleRepo(ArticleService()))..getArticles(''),
      child: Scaffold(
        body: BlocBuilder<ArticleCubit, ArticleState>(
          builder: (context, state) {
            if (state is ArticlIsLoading) {
              return Center(
                  child: LoadingAnimationWidget.hexagonDots(
                      color: Colors.black, size: 70));
            } else if (state is ArticlLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(top: 70),
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back)),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SearchField(
                                controller: controller,
                                onChangedFun: (value) {
                                  context
                                      .read<ArticleCubit>()
                                      .addSearchedToFilteredList(
                                          value, state.articles);
                                },
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      context
                                          .read<ArticleCubit>()
                                          .searchClear(controller);
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .85,
                        child: controller.text.isNotEmpty &&
                                state.filtered.isEmpty
                            ? NoSearchFound(
                                searchedText: controller.text,
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.text.isEmpty
                                    ? state.articles.length
                                    : state.filtered.length,
                                itemBuilder: ((context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, articleDetailsScreen,
                                            arguments: controller.text.isEmpty
                                                ? state.articles[index]
                                                : state.filtered[index]);
                                      },
                                      child: BreakingNewsContainer(
                                          index: index,
                                          articles: controller.text.isEmpty
                                              ? state.articles
                                              : state.filtered));
                                })),
                      )
                    ]),
              );
            }
            return const Text('Something Went Wrong');
          },
        ),
      ),
    );
  }
}
