import 'package:flutter_application_1/data/model/article_model.dart';
import 'package:flutter_application_1/data/service/article_service.dart';


class ArticleRepo{
  final ArticleService articleService;
  ArticleRepo(this.articleService);
 Future<List<Articles>> getArticles(String category)async{
  final articles=await articleService.getArticles(category);
  return 
  articles.map((e) => Articles.fromJson(e)).toList();
 }
}