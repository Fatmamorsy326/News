import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/home/categories_view/categories_view.dart';
import 'package:news/features/home/home_drawer.dart';
import 'package:news/features/home/source_view/source_view.dart';
import 'package:news/models/category_model.dart';
import 'package:news/providers/home_view_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var homeProvider=Provider.of<HomeViewProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(homeProvider.homeTitle,style: Theme.of(context).textTheme.titleSmall,),
        centerTitle: true,
      ),
      drawer: HomeDrawer(),
      body: homeProvider.homeView,
    );
  }




}
