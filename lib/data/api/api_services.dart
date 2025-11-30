import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news/data/api/models/article_response/Article.dart';
import 'package:news/data/api/models/article_response/ArticleResponse.dart';
import 'package:news/data/api/models/sources_response/Source.dart';
import 'package:news/data/api/models/sources_response/SourcesResponse.dart';
import 'package:news/models/category_model.dart';
import 'package:http/http.dart' as http;


class ApiServices {
  static const apiKey="6228a6e4af34415ebd9a4084b1cf2f9b";
  static const baseUrl="newsapi.org";
  static const sourcesEndPoint="/v2/top-headlines/sources";
  static const articlesEndPoint="/v2/everything";
  Future<Either<String,List<Source>>> getSources(CategoryModel category) async {
    Uri url=Uri.https(baseUrl,sourcesEndPoint,
        {
          "apiKey":apiKey,
          "category":category.id
        }
    );

    try{
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == "error") {
        return left("error:${sourcesResponse.message}");
      }
      else {
        return right(sourcesResponse.sources ?? []);
      }
    }on SocketException {
      return left("No internet connection. Please check your network.");
    } on HttpException {
      return left("HTTP error occurred. Please try again.");
    } on FormatException {
      return left("Invalid response format from server.");
    } on http.ClientException {
      return left("Failed to connect to server. Please try again.");
    } catch (exception) {
      return left("An unexpected error occurred: ${exception.toString()}");
    }

  }

   Future<Either<String,List<Article>>> getArticles(Source source,[String? searchKey]) async{
   Map<String,dynamic> params={
     "apiKey":apiKey,
     "sources":source.id
   };
   params["q"]=searchKey;
   Uri url=Uri.https(baseUrl,articlesEndPoint,params);
   try{
     var response = await http.get(url);
     var json = jsonDecode(response.body);
     ArticleResponse articleResponse = ArticleResponse.fromJson(json);
     if (articleResponse.status == "error") {
       return left("error:${articleResponse.message}");
     }
     else {
       return right(articleResponse.articles ?? []);
     }
   }on SocketException {
     return left("No internet connection. Please check your network.");
   } on HttpException {
     return left("HTTP error occurred. Please try again.");
   } on FormatException {
     return left("Invalid response format from server.");
   } on http.ClientException {
     return left("Failed to connect to server. Please try again.");
   } catch (exception) {
     return left("An unexpected error occurred: ${exception.toString()}");
   }

  }
}