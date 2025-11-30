import 'package:flutter/cupertino.dart';
import 'package:news/data/api/api_services.dart';
import 'package:news/data/api/models/article_response/Article.dart';
import 'package:news/data/api/models/sources_response/Source.dart';
import 'package:news/repositories/article_repository.dart';

class ArticleViewModel extends ChangeNotifier {
  ArticleRepository articleRepository;
  ArticleViewModel({required this.articleRepository});
  bool loading=false;
  String errorMessage='';
  List<Article> articles=[];
  Future<void> loadArticles(Source source,[String? searchKey])async{
    loading=true;
    notifyListeners();
    var result=await articleRepository.getArticles(source,searchKey);
    loading=false;
    notifyListeners();
    result.fold((message){
      errorMessage=message;
    }, (articlesList){
      articles=articlesList;
    });
    notifyListeners();
  }
}