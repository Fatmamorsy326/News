import 'package:flutter/cupertino.dart';
import 'package:news/api/api_services.dart';
import 'package:news/api/models/article_response/Article.dart';
import 'package:news/api/models/sources_response/Source.dart';

class ArticleViewModel extends ChangeNotifier {
  bool loading=false;
  String errorMessage='';
  List<Article> articles=[];
  Future<void> loadArticles(Source source,[String? searchKey])async{
    loading=true;
    notifyListeners();
    var result=await ApiServices.getArticles(source,searchKey);
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