import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercommerce/presentation/res/text_styles.dart';

import 'app_colors.dart';
import 'font_family.dart';

class AppTheme {
  AppTheme();

  static ThemeData appTheme({bool dark = false}) {
    return ThemeData(
      fontFamily: AppFonts.poppins,
      primaryColor: AppColors.primaryColor,
      backgroundColor: dark ? AppColors.black : AppColors.white,
      scaffoldBackgroundColor: dark ? AppColors.black : AppColors.white,
      cardTheme: CardTheme(
        elevation: 1,
        shape: RoundedRectangleBorder(
            side: BorderSide(
          color: AppColors.white,
        )),
        margin: EdgeInsets.only(),
        color: dark ? AppColors.black : AppColors.white,
      ),
      indicatorColor: AppColors.primaryColor,
      buttonTheme: ButtonThemeData(
        focusColor: AppColors.primaryColor,
        disabledColor: AppColors.primaryColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        highlightColor: Colors.transparent,
        buttonColor: AppColors.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.primaryColor.withOpacity(0.5);
              } else {
                return AppColors.primaryColor;
              }
            },
          ),
          elevation: MaterialStateProperty.all(0),
          foregroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: dark ? AppColors.white : AppColors.black,
        // unselectedLabelColor: AppColors.color4C4C6F,
        labelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: AppColors.black,
        ),
        headline2: TextStyle(
          fontSize: 20,
          color: dark ? AppColors.dropShadow : AppColors.color20203E,
          fontWeight: FontWeight.w500,
        ),
        headline3: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        headline4: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: AppColors.color20203E,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: AppColors.primaryColor,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          color: AppColors.color4C4C6F,
        ),
        subtitle2: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        bodyText2: TextStyle(
          color: AppColors.black,
          fontSize: 14,
        ),
        caption: TextStyle(
          fontSize: 14,
          color: AppColors.color4C4C6F,
        ),
        button: TextStyle(
          color: AppColors.color4C4C6F,
          fontSize: 12,
        ),
        overline: TextStyle(
          color: AppColors.color4C4C6F,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        titleTextStyle: AppTextStyles.textTheme.headline5,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
    );
  }
}
