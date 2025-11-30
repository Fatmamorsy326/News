import 'package:flutter/cupertino.dart';
import 'package:news/data/api/api_services.dart';
import 'package:news/data/api/models/sources_response/Source.dart';
import 'package:news/models/category_model.dart';
import 'package:news/repositories/sources_repository.dart';

class SourceViewModel extends ChangeNotifier {
  SourcesRepository sourcesRepository;
  SourceViewModel({required this.sourcesRepository});
   bool loading=false;
  String? errorMessage;
   List<Source> sources=[];
  Future<void> loadSources(CategoryModel category) async {
    loading=true;
    notifyListeners();
    var result =await sourcesRepository.getSources(category);
    loading=false;
    notifyListeners();
    result.fold((message){
      errorMessage=message;
    }, (sourcesList){
      sources=sourcesList;
    });
    notifyListeners();
  }
}