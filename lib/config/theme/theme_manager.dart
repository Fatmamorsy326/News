import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/resources/colors_manager.dart';

class ThemeManager {
  static ThemeData light=ThemeData(
    primaryColor: ColorsManager.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.white,
      secondary: ColorsManager.black,
      tertiary: ColorsManager.gray,
    ),
    scaffoldBackgroundColor: ColorsManager.white,
    textTheme: TextTheme(
        titleSmall: GoogleFonts.inter(color:ColorsManager.black ,fontWeight: FontWeight.w500,fontSize:24.sp ),
      bodyMedium: GoogleFonts.inter(color:ColorsManager.white ,fontWeight: FontWeight.w700,fontSize:20.sp ),
      labelMedium: GoogleFonts.inter(color:ColorsManager.black ,fontWeight: FontWeight.w700,fontSize:16.sp ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16.r),
            ),
            padding: REdgeInsets.symmetric(vertical: 16,horizontal: 16),
            foregroundColor: ColorsManager.black,
        )
    ),
  );




  static ThemeData dark=ThemeData(
    primaryColor: ColorsManager.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.black,
      secondary: ColorsManager.white,
      tertiary: ColorsManager.gray,
    ),
    scaffoldBackgroundColor: ColorsManager.black,
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(color:ColorsManager.white ,fontWeight: FontWeight.w500,fontSize:24.sp ),
      bodyMedium: GoogleFonts.inter(color:ColorsManager.white ,fontWeight: FontWeight.w700,fontSize:20.sp ),
      labelMedium: GoogleFonts.inter(color:ColorsManager.white ,fontWeight: FontWeight.w700,fontSize:16.sp ),

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16.r),
          ),
          padding: REdgeInsets.symmetric(vertical: 16,horizontal: 16),
          foregroundColor: ColorsManager.white,
        )
    ),
  );
}