import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/article_model.dart';
import 'package:flutter_application_1/data/repo/article_repo.dart';
import 'package:url_launcher/url_launcher.dart';


part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit(this.articleRepo) : super(ArticleInitial());
  List<Articles>articles=[];
  List<Articles>searchedArticles=[];
  
   Future lancher(String url)async{
   await launchUrl(Uri.parse(url));
   }
  final ArticleRepo articleRepo;
  
  searchClear(TextEditingController controller){
    controller.clear();
    emit(ArticlLoaded(articles, searchedArticles));
  }
   void addSearchedToFilteredList(String typedText,List<Articles>list){
    searchedArticles=list.where((element) => element.title!.contains(typedText)
    ||element.title!.toLowerCase().contains(typedText)).toList();
    emit(ArticlLoaded(articles, searchedArticles));
  } 
  List<Articles>getArticles(String category){
      emit(ArticlIsLoading()); 
    articleRepo.getArticles(category).then((articles) {
      emit(ArticlLoaded(articles,searchedArticles));
      this.articles=articles;
    });
    return articles;
  } 
}
