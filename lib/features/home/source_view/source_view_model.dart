import 'package:flutter/cupertino.dart';
import 'package:news/api/api_services.dart';
import 'package:news/api/models/sources_response/Source.dart';
import 'package:news/api/models/sources_response/SourcesResponse.dart';
import 'package:news/models/category_model.dart';

class SourceViewModel extends ChangeNotifier {
   bool loading=false;
  String? errorMessage;
   List<Source> sources=[];
  Future<void> loadSources(CategoryModel category) async {
    loading=true;
    notifyListeners();
    var result =await ApiServices.getSources(category);
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