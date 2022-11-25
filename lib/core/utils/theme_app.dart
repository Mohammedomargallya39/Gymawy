import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'colors_manager.dart';

class ThemeApp {
  String fontAr = 'arabic';
  String fontEn = 'english';

  ThemeData whiteTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: ColorManager.mainColor,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.whiteColor.withOpacity(0.8),
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          size: 20.0,
          color: ColorManager.textFieldColor,
        ),
        titleTextStyle: TextStyle(
          fontFamily: fontEn,
          fontSize: 18.0,
          color: ColorManager.darkColor,
          fontWeight: FontWeight.bold,
        ),
        // titleSpacing: 32,
        elevation: 5.0,
      ),
      primarySwatch: ColorManager.mainColor.toMaterialColor(),
      primaryColor: ColorManager.mainColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: ColorManager.mainColor, // background (button) color
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
// foreground (text) color
        ),
      ),
      textTheme: TextTheme(
        displaySmall: TextStyle(
          fontSize: 14.0,
          fontFamily: fontEn,
          fontWeight: FontWeight.w600,
          color: ColorManager.darkColor,
          height: 1.3,
        ),
        displayMedium: TextStyle(
          fontFamily: fontEn,
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
          color: ColorManager.darkColor,
        ),
        displayLarge: TextStyle(
          fontSize: 25.0,
          fontFamily: fontEn,
          fontWeight: FontWeight.w700,
          color: ColorManager.darkColor,
        ),
        headlineLarge: TextStyle(
          fontFamily: fontEn,
          fontSize: 90.0.w,
          // fontWeight: FontWeight.bold,
          color: ColorManager.darkColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontEn,
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
          color: ColorManager.darkColor,
        ),



      ),

    );
  }

  // ThemeData blackTheme() {
  //   return ThemeData(
  //     scaffoldBackgroundColor: ColorManager.mainDark,
  //     backgroundColor: ColorManager.selectItem,
  //     appBarTheme: AppBarTheme(
  //       systemOverlayStyle: SystemUiOverlayStyle(
  //         statusBarColor: ColorManager.mainDark.withOpacity(0.6),
  //         statusBarIconBrightness: Brightness.light,
  //       ),
  //       backgroundColor: ColorManager.mainDark,
  //       elevation: 5.0,
  //       iconTheme: IconThemeData(
  //         size: 20.0,
  //         color: ColorManager.selectItem,
  //       ),
  //       titleTextStyle: TextStyle(
  //         fontFamily: fontEn,
  //         fontSize: 18.0,
  //         color: ColorManager.selectItem,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     primarySwatch: Colors.redAccent.toMaterialColor(),
  //     textTheme: TextTheme(
  //       displaySmall: TextStyle(
  //         fontSize: 20.0,
  //         fontFamily: fontEn,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.white,
  //         height: 1.3,
  //       ),
  //       displayMedium: TextStyle(
  //         fontFamily: fontEn,
  //         fontSize: 14.0,
  //         fontWeight: FontWeight.w400,
  //         color: Colors.white,
  //       ),
  //       displayLarge: TextStyle(
  //         fontSize: 25.0,
  //         fontFamily: fontEn,
  //         fontWeight: FontWeight.w700,
  //         color: Colors.white,
  //       ),
  //     ),
  //   );
  // }

}