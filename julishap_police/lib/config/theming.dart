import 'package:flutter/material.dart';

class AppThemeData {
  // Colors: Main Colors
  static const Color primaryColor = Color(0xffFFAB40);
  static const Color secondaryColor = Color(0xffFFFFFF);

  // Colors: Text
  static const textPrimary = primaryColor;
  static const textWhite = secondaryColor;
  static const textBlack = Color(0xff212121);
  static const textGrey = Color(0xff757575);

  // Colors: Buttons and Icons
  static const buttonPrimary = primaryColor;
  static const buttonSecondary = secondaryColor;
  static const iconPrimary = primaryColor;
  static const iconGrey = Color(0xff616161);
  static const iconWhite = Color(0xffFFFFFF);
  static const iconBlack = Color(0xff212121);

  // Colors: Background and Cards
  static const backgroundWhite = secondaryColor;
  static const backgroundGrey = Color(0xffBDBDBD);
  static const backgroundRed = Color.fromRGBO(183, 28, 28, 1.0);
  static const backgroundGreen = Color(0xff2E7D32);
  static const cardGrey = Color(0xffEEEEEE);

  // Radius
  static const double cornerRadiusCard = 40.0;
  static const double cornerRadiusCardButton = 10.0;
  static const double cornerRadiusTextFields = 10.0;

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColor,
    fontFamily: 'Questrial',
    iconTheme: const IconThemeData(color: iconPrimary),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: AppThemeData.textBlack),
      titleMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: AppThemeData.textBlack),
      titleSmall: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppThemeData.textWhite),
      labelLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppThemeData.textBlack),
    ),
    colorScheme: const ColorScheme.light().copyWith(background: backgroundWhite),
    inputDecorationTheme:  InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(cornerRadiusTextFields),
        borderSide: const BorderSide(color: backgroundGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(cornerRadiusTextFields),
        borderSide: const BorderSide(color: backgroundGrey),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadiusTextFields),
          borderSide: const BorderSide(color: backgroundGrey, width: 2)
      ),
      hintStyle: const TextStyle(
        color: textGrey,
      ),
      labelStyle: const TextStyle(
        color: textGrey,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: 'Questrial',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme:  const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(buttonPrimary),
        elevation: MaterialStatePropertyAll(2.0),
      ),
    ),
  );
}