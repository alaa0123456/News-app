import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/article_cubit/article_cubit.dart';

import 'package:flutter_application_1/data/model/article_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key, required this.articles});
  final Articles articles;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Positioned(
                  top: 0,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        image: articles.urlToImage != null
                            ? DecorationImage(
                                image: NetworkImage(
                                    articles.urlToImage.toString()),
                                fit: BoxFit.cover)
                            : const DecorationImage(
                                image: AssetImage('assets/images/3.jpg'),
                                fit: BoxFit.cover)),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Column(
                      children: [
                        Text(
                          articles.title.toString(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          articles.content.toString(),
                          maxLines: 10,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        TextButton(
                            onPressed: () {
                              context
                                  .read<ArticleCubit>()
                                  .lancher(articles.url.toString());
                            },
                            child: const Text('Read more'))
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
