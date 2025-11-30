import 'package:dartz/dartz.dart';
import 'package:news/data/api/models/article_response/Article.dart';
import 'package:news/data/api/models/sources_response/Source.dart';

abstract class ArticleRemoteDs {
  Future<Either<String,List<Article>>> getArticles(Source source,[String? searchKey]);
}