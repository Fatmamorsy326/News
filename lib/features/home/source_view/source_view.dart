import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/features/home/source_view/article_item.dart';
import 'package:news/features/home/source_view/article_view_model.dart';
import 'package:news/features/home/source_view/source_view_model.dart';
import 'package:news/models/category_model.dart';
import 'package:provider/provider.dart';

class SourceView extends StatefulWidget {
  CategoryModel category;
   SourceView({super.key,required this.category});

  @override
  State<SourceView> createState() => _SourceViewState();
}

class _SourceViewState extends State<SourceView> {
  late SourceViewModel sourceViewModel;
  late ArticleViewModel articleViewModel;

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }
  void fetchData()async{
    sourceViewModel=SourceViewModel();
    articleViewModel=ArticleViewModel();
    await sourceViewModel.loadSources(widget.category);
    await articleViewModel.loadArticles(sourceViewModel.sources[0]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(value: sourceViewModel),
      ChangeNotifierProvider.value(value: articleViewModel),
    ],
      child: Column(
        children: [
          Consumer<SourceViewModel>(
            builder: (context, sourceViewModel, child){
              if(sourceViewModel.loading){
                return Center(child: CircularProgressIndicator());
              }
              if(sourceViewModel.errorMessage!=null){
                return Center(child: Text(sourceViewModel.errorMessage!,style: Theme.of(context).textTheme.labelMedium,));
              }
              if(sourceViewModel.sources.isEmpty){
                return Center(child: Text("No Sources Found",style: Theme.of(context).textTheme.labelMedium,));
              }
              return DefaultTabController(
                  length: sourceViewModel.sources.length,
                  child: TabBar(
                      onTap: (index) {
                        articleViewModel.loadArticles(sourceViewModel.sources[index]);
                      },
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      indicatorColor: Theme.of(context).colorScheme.secondary,
                      labelStyle:GoogleFonts.inter(fontSize:16.sp ,fontWeight:FontWeight.w700 ,color: Theme.of(context).colorScheme.secondary),
                      unselectedLabelStyle: GoogleFonts.inter(fontSize:14.sp ,fontWeight:FontWeight.w500 ,color: Theme.of(context).colorScheme.secondary),
                      tabs:sourceViewModel.sources.map((source) => Tab(text: source.name,)).toList()
                  )
              );
            },
          ),
          SizedBox(height: 16.h,),
          Consumer<ArticleViewModel>(builder: (context, articleViewModel, child) {
            if(articleViewModel.loading){
              return Center(child: CircularProgressIndicator());
            }
            if(articleViewModel.errorMessage.isNotEmpty){
              return Center(child: Text(articleViewModel.errorMessage,style: Theme.of(context).textTheme.labelMedium,));
            }
            if(sourceViewModel.sources.isEmpty){
              return Container();
            }
            if(articleViewModel.articles.isEmpty){
              return Center(child: Text("No articles Found",style: Theme.of(context).textTheme.labelMedium,));
            }
            return Expanded(child: ListView.separated(
                itemBuilder: (context, index) => ArticleItem(article: articleViewModel.articles[index],),
                separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                itemCount: articleViewModel.articles.length
            ));
          },)
        ],
      ),
    );

  }
}
