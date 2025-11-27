import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/resources/colors_manager.dart';
import 'package:news/providers/config_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
   const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var configProvider=Provider.of<ConfigProvider>(context);
    return Drawer(
      backgroundColor: ColorsManager.black,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 166.h,
            color: ColorsManager.white,
            alignment: Alignment.center,
            child: Text("News App",style: GoogleFonts.inter(fontSize: 24.sp,fontWeight:FontWeight.w700 ,color: ColorsManager.black),),
          ),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Row(
                    children: [
                      Icon(Icons.home_rounded,color: ColorsManager.white,),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text("Go to home",style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Divider(
                  thickness: 1.w,
                  color: ColorsManager.white,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Icon(Icons.imagesearch_roller_outlined,color: ColorsManager.white,),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text("Theme",style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  padding: REdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(width: 1.w,color: ColorsManager.white),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: configProvider.isDark ? "Dark" : "Light",
                      onChanged: (value) {
                        configProvider.changeTheme(
                            value == "Dark" ? ThemeMode.dark : ThemeMode.light
                        );
                      },
                      dropdownColor: Colors.black,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20.sp),
                      items: [
                        DropdownMenuItem(
                          value: "Dark",
                          child: Text("Dark Theme"),
                        ),
                        DropdownMenuItem(
                          value: "Light",
                          child: Text("Light Theme"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
