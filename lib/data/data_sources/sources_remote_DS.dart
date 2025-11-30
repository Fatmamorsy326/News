import 'package:dartz/dartz.dart';
import 'package:news/data/api/models/sources_response/Source.dart';
import 'package:news/models/category_model.dart';

abstract class SourcesRemoteDs {
  Future<Either<String,List<Source>>> getSources(CategoryModel category);
}