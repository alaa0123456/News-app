import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/article_model.dart';

class BreakingNewsContainer extends StatelessWidget {
  const BreakingNewsContainer(
      {super.key, required this.articles, required this.index});

  final int index;
  final List<Articles> articles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: articles[index].urlToImage != null
                    ? DecorationImage(
                        image:
                            NetworkImage(articles[index].urlToImage.toString()),
                        fit: BoxFit.cover)
                    : const DecorationImage(
                        image: AssetImage('assets/images/3.jpg'),
                        fit: BoxFit.cover),
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              articles[index].title.toString(),
              maxLines: 3,
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        ],
      ),
    );
  }
}
