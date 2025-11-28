import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news/api/models/sources_response/Source.dart';
import 'package:news/api/models/sources_response/SourcesResponse.dart';
import 'package:news/models/category_model.dart';
import 'package:http/http.dart' as http;


class ApiServices {
  static const apiKey="6228a6e4af34415ebd9a4084b1cf2f9b";
  static const baseUrl="newsapi.org";
  static const sourcesEndPoint="/v2/top-headlines/sources";

 static Future<Either<String,List<Source>>> getSources(CategoryModel category) async {
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
}