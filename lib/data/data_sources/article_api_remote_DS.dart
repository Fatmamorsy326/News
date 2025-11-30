import 'package:dartz/dartz.dart';
import 'package:news/data/api/api_services.dart';
import 'package:news/data/api/models/article_response/Article.dart';
import 'package:news/data/api/models/sources_response/Source.dart';
import 'package:news/data/data_sources/article_remote_DS.dart';

class ArticleApiRemoteDs implements ArticleRemoteDs{
  ApiServices apiServices;
  ArticleApiRemoteDs({required this.apiServices});
  @override
  Future<Either<String, List<Article>>> getArticles(Source source, [String? searchKey]) {
    return apiServices.getArticles(source,searchKey);
  }

}