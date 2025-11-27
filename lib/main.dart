import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/config/theme/theme_manager.dart';
import 'package:news/core/Routes_manager/app_routes.dart';
import 'package:news/core/Routes_manager/routes_manager.dart';
import 'package:news/core/prefs_manager/prefs_manager.dart';
import 'package:news/providers/config_provider.dart';
import 'package:news/providers/home_view_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ConfigProvider()),
    ChangeNotifierProvider(create: (context) => HomeViewProvider()),
  ],child: News(),));
}

class News extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var configProvider=Provider.of<ConfigProvider>(context);
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>MaterialApp(
        locale: Locale("en"),
        supportedLocales: [
          Locale("en"),
          Locale("ar"),
        ],
        initialRoute: AppRoutes.splash,
        themeMode: configProvider.currentTheme,
        darkTheme:ThemeManager.dark ,
        theme: ThemeManager.light,
        onGenerateRoute: RoutesManager.router,
        debugShowCheckedModeBanner: false,
      ) ,
    );
  }
}