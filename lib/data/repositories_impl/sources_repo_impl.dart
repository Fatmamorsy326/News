import 'package:dartz/dartz.dart';
import 'package:news/data/api/models/sources_response/Source.dart';
import 'package:news/data/data_sources/sources_remote_DS.dart';
import 'package:news/models/category_model.dart';
import 'package:news/repositories/sources_repository.dart';

class SourcesRepoImpl implements SourcesRepository{
  late SourcesRemoteDs sourcesRemoteDs;
  SourcesRepoImpl(this.sourcesRemoteDs);
  @override
  Future<Either<String, List<Source>>> getSources(CategoryModel category) {
    return sourcesRemoteDs.getSources(category);
  }

}