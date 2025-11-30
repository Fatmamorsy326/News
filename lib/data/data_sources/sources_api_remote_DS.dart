import 'package:dartz/dartz.dart';
import 'package:news/data/api/api_services.dart';
import 'package:news/data/api/models/sources_response/Source.dart';
import 'package:news/data/data_sources/sources_remote_DS.dart';
import 'package:news/models/category_model.dart';

class SourcesApiRemoteDs implements SourcesRemoteDs{
  ApiServices apiServices;
  SourcesApiRemoteDs(this.apiServices);
  @override
  Future<Either<String, List<Source>>> getSources(CategoryModel category) {
    return apiServices.getSources(category);
  }

}