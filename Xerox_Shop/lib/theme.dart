import 'customthemes/appbar_theme.dart';
import 'customthemes/bottomsheet.dart';
import 'customthemes/checkboxtheme.dart';
import 'customthemes/elevated_button_theme.dart';
import 'customthemes/outlinebuttontheme.dart';
import 'package:flutter/material.dart';
import 'customthemes/chip_theme.dart';
import 'customthemes/text_theme.dart';
import 'customthemes/textfieldtheme.dart';
class CustomTheme{
  CustomTheme._();

  static ThemeData light = ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        primaryColor: Colors.purpleAccent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: CustomTextTheme.light,
        appBarTheme: CustomAppBarTheme.lightAppBarTheme,
        chipTheme: CustomChipTheme.lightChipTheme,
        checkboxTheme: CustomCheckBox.lightCheckBoxTheme,
        bottomSheetTheme: CustomButtonSheet.lightBottomSheet,
        elevatedButtonTheme: CustomElevatedButton.lightElevatedButton,
        outlinedButtonTheme: CustomOutlineButton.lightOutline,
        inputDecorationTheme: TextFieldTheme.lightInputDecorationTheme,
    );

  static ThemeData dark = ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        primaryColor: Colors.purpleAccent,
        scaffoldBackgroundColor: Colors.black,
        textTheme: CustomTextTheme.dark,
        appBarTheme: CustomAppBarTheme.darkAppBarTheme,
        chipTheme: CustomChipTheme.darkChipTheme,
        checkboxTheme: CustomCheckBox.darkCheckBoxTheme,
        bottomSheetTheme: CustomButtonSheet.darkBottomSheet,
        elevatedButtonTheme: CustomElevatedButton.darkElevatedButton,
        outlinedButtonTheme: CustomOutlineButton.darkOutline,
        inputDecorationTheme: TextFieldTheme.darkInputDecorationTheme,
    );

}
