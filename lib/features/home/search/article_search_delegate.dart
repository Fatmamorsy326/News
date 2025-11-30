import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/data/api/models/sources_response/Source.dart';
import 'package:news/features/home/source_view/article_item.dart';
import 'package:news/features/home/source_view/article_view_model.dart';
import 'package:news/features/home/source_view/source_view_model.dart';
import 'package:provider/provider.dart';

class ArticleSearchDelegate extends SearchDelegate<String> {
  final ArticleViewModel articleViewModel;
  final Source currentSource;
  String _lastQuery = '';
  bool _isSearching = false;

  ArticleSearchDelegate(
      this.articleViewModel,
      this.currentSource,
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          _lastQuery = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
        articleViewModel.loadArticles(currentSource);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(
          'Please enter a search term',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      );
    }

    if (_lastQuery != query && !_isSearching) {
      _lastQuery = query;
      _isSearching = true;

      // Use post frame callback to avoid calling during build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        articleViewModel.loadArticles(currentSource, query).then((_) {
          _isSearching = false;
        });
      });
    }

    return ChangeNotifierProvider.value(
      value: articleViewModel,
      child: Consumer<ArticleViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage.isNotEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  viewModel.errorMessage,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (viewModel.articles.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  'No articles found for "$query"',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.all(16.w),
            itemCount: viewModel.articles.length,
            itemBuilder: (context, index) => ArticleItem(
              article: viewModel.articles[index],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 64.sp,
              color: Colors.grey,
            ),
            SizedBox(height: 16.h),
            Text(
              query.isEmpty
                  ? 'Search for articles in ${currentSource.name}'
                  : 'Press enter to search for "$query"',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}