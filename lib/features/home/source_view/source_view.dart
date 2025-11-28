import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/api/api_services.dart';
import 'package:news/api/models/sources_response/Source.dart';
import 'package:news/features/home/source_view/article_item.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    sourceViewModel=SourceViewModel();
    sourceViewModel.loadSources(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sourceViewModel,
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
              if(sourceViewModel.sources.isNotEmpty){
                return DefaultTabController(
                    length: sourceViewModel.sources.length,
                    child: TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        dividerColor: Colors.transparent,
                        indicatorColor: Theme.of(context).colorScheme.secondary,
                        labelStyle:GoogleFonts.inter(fontSize:16.sp ,fontWeight:FontWeight.w700 ,color: Theme.of(context).colorScheme.secondary),
                        unselectedLabelStyle: GoogleFonts.inter(fontSize:14.sp ,fontWeight:FontWeight.w500 ,color: Theme.of(context).colorScheme.secondary),
                        tabs:sourceViewModel.sources.map((source) => Tab(text: source.name,)).toList()
                    )
                );
              }
              return Center(child: Text("No Sources Found"));
            },
          ),
        ],
      ),
    );
  }
}
