import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/Routes_manager/app_routes.dart';
import 'package:news/core/resources/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  REdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset(AssetsManager.logo,color: Theme.of(context).colorScheme.secondary,),
              Spacer(),
              Image.asset(AssetsManager.newBranding,color: Theme.of(context).colorScheme.secondary,width: 215.w,),
            ],
          ),
        ),
      ),
    );
  }
}
