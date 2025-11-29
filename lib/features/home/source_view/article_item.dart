import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/api/models/article_response/Article.dart';
import 'package:news/core/resources/colors_manager.dart';

class ArticleItem extends StatelessWidget {
  Article article;
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
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage??'',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(article.title??'',style: Theme.of(context).textTheme.labelMedium,),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(child: Text(article.author??'',style: GoogleFonts.inter(color: ColorsManager.gray,fontWeight:FontWeight.w500 ,fontSize: 12.sp))),
              Spacer(),
              Expanded(child: Text(article.publishedAt??'',style: GoogleFonts.inter(color: ColorsManager.gray,fontWeight:FontWeight.w500 ,fontSize: 12.sp),)),
            ],
          )
        ],
      ),
    );
  }
}
