import 'package:code_generator_app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.white,
      secondary: AppColors.backgroundColor,
      onSecondary: AppColors.backgroundColor,
      error: Colors.redAccent,
      onError: Colors.redAccent,
      surface: AppColors.primaryColor,
      onSurface: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarColor,
      foregroundColor: AppColors.white,
    ),
    /*
        INPUT DECORATION
    */
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        color: AppColors.grayColor,
      ),
      floatingLabelStyle: const TextStyle(
        color: AppColors.lightPrimaryColor,
      ),
      prefixIconColor: AppColors.grayColor,
      suffixIconColor: AppColors.grayColor,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      filled: true,
      fillColor: AppColors.appBarColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1000),
        borderSide: BorderSide.none,
      ),
    ),
    /*
        ELEVATED BUTTON
    */
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        //TODO Изменить цвет нажатия
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.lightPrimaryColor.withAlpha(50);
          }
          return AppColors.lightPrimaryColor;
        }),
        foregroundColor:
            const WidgetStatePropertyAll(AppColors.backgroundColor),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    /*
        TEXT BUTTON
    */
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColors.grayColor),
      ),
    ),
    /*
        SNACK BAR
    */
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.appBarColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    /*
        DRAWER
    */
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.backgroundColor,
    ),
  );
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}
