import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/categories_view/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesView extends StatelessWidget {
   const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning\nHere is Some News For You",style: Theme.of(context).textTheme.titleSmall,),
          SizedBox(height: 16.h,),
          Expanded(child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                  },
                  child: CategoryItem(category: CategoryModel.categories[index])),
              separatorBuilder: (context, index) => SizedBox(height: 16.h,),
              itemCount: CategoryModel.categories.length)),
        ],
      ),
    );
  }
}
