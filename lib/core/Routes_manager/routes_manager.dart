import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/core/Routes_manager/app_routes.dart';
import 'package:news/features/home/home.dart';
import 'package:news/features/splash/splash_screen.dart';

class RoutesManager {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:{
        return CupertinoPageRoute(builder: (context) => Home(),);
      }
      case AppRoutes.splash:{
        return CupertinoPageRoute(builder: (context) => SplashScreen(),);
      }
    }
  }
}