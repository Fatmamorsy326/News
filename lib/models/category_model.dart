import 'package:news/core/resources/assets_manager.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;
  CategoryModel({
    required this.id,
    required this.title,
    required this.imagePath,
});
  static List<CategoryModel> categories=[
    CategoryModel(id: "business", title: "Business", imagePath: AssetsManager.business),
    CategoryModel(id: "sports", title: "Sports", imagePath: AssetsManager.sports),
    CategoryModel(id: "entertainment", title: "Entertainment", imagePath: AssetsManager.entertainment),
    CategoryModel(id: "general", title: "general", imagePath: AssetsManager.general),
    CategoryModel(id: "technology", title: "Technology", imagePath: AssetsManager.technology),
    CategoryModel(id: "science", title: "Science", imagePath: AssetsManager.science),
    CategoryModel(id: "health", title: "Health", imagePath: AssetsManager.health),
  ];

}