import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  CategoryItem({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16.r),
      child: Image.asset(category.imagePath,fit: BoxFit.cover,width: double.infinity),
    );
  }
}
