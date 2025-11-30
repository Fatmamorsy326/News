import 'package:dartz/dartz.dart';
import 'package:news/data/api/models/article_response/Article.dart';
import 'package:news/data/api/models/sources_response/Source.dart';
import 'package:news/data/data_sources/article_remote_DS.dart';
import 'package:news/repositories/article_repository.dart';

class ArticleRepoImpl implements ArticleRepository{
  late ArticleRemoteDs articleRemoteDs;
  ArticleRepoImpl({required this.articleRemoteDs});
  @override
  Future<Either<String, List<Article>>> getArticles(Source source, [String? searchKey]) {
    return articleRemoteDs.getArticles(source,searchKey);
  }

}