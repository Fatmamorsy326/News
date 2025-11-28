import 'package:flutter/cupertino.dart';
import 'package:news/features/home/categories_view/categories_view.dart';
import 'package:news/features/home/source_view/source_view.dart';
import 'package:news/models/category_model.dart';

class HomeViewProvider extends ChangeNotifier {
  Widget homeView = CategoriesView();
  String homeTitle = "Home";

  void goToCategoriesView(){
    homeView=CategoriesView();
    homeTitle="Home";
    notifyListeners();
  }

  void goToSourceView(CategoryModel category) {
    homeView = SourceView(category: category,);
    homeTitle = category.title;
    notifyListeners();
  }

}