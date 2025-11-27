import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/categories_view/categories_view.dart';
import 'package:news/features/home/home_drawer.dart';
import 'package:news/features/home/source_view/source_view.dart';
import 'package:news/models/category_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        title: Text("home",style: Theme.of(context).textTheme.titleSmall,),
        centerTitle: true,
        actions: [
          Icon(Icons.search,color: Theme.of(context).colorScheme.secondary,weight: 24.sp,),
        ],
      ),
      drawer: HomeDrawer(),
      body: SourceView(),
    );
  }




}
