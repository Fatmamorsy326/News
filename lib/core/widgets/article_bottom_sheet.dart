import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/data/api/models/article_response/Article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleBottomSheet extends StatelessWidget {
   Article article;
   ArticleBottomSheet({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 8,vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 1.w,color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(16.r),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage??'',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(article.description??'',style: GoogleFonts.inter(color:Theme.of(context).primaryColor ,fontWeight: FontWeight.w500,fontSize:14.sp,letterSpacing: -0.4,height: 1.5),maxLines: 5,overflow: TextOverflow.ellipsis,),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              _launchURL(article.url??'');
            }, child: Text("View Full Articel",style: Theme.of(context).textTheme.labelMedium,)),
          )

        ],
      ),
    );
  }
  Future<void> _launchURL(String articleUrl) async {
    final Uri url = Uri.parse(articleUrl);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
