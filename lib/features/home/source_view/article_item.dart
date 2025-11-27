import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/resources/colors_manager.dart';
import 'package:news/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  ArticleModel article;
   ArticleItem({super.key,required this.article});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 8,vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 1.w,color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.network(article.urlToImage),
            borderRadius: BorderRadius.circular(16.r),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(article.title,style: Theme.of(context).textTheme.labelMedium,),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(child: Text(article.author,style: GoogleFonts.inter(color: ColorsManager.gray,fontWeight:FontWeight.w500 ,fontSize: 12.sp))),
              Spacer(),
              Expanded(child: Text(article.publishedAt,style: GoogleFonts.inter(color: ColorsManager.gray,fontWeight:FontWeight.w500 ,fontSize: 12.sp),)),
            ],
          )
        ],
      ),
    );
  }
}
