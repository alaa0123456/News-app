part of 'article_cubit.dart';

abstract class ArticleState {}


class ArticleInitial extends ArticleState {}
class ArticlIsLoading extends ArticleState{}
class ArticlLoaded extends ArticleState{
  List<Articles> articles;
  List<Articles> filtered;
  ArticlLoaded(this.articles,this.filtered);
}
class ArticlFailed extends ArticleState{}
class ChangeIndex extends ArticleState{}