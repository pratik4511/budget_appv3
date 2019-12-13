import 'dart:io';
import 'package:budget_appv3/UI/LanguagePage.dart';
import 'package:budget_appv3/UI/SectorPage.dart';
import 'package:budget_appv3/UI/SelectionPage.dart';
import 'package:budget_appv3/UI/StartIntoApp.dart';
import 'package:budget_appv3/UI/SectorPage.dart';
import 'package:flutter/material.dart';
import 'UI/SplashScreen.dart';
import 'UI/SelectionPage.dart';
//import 'UI/Start.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.redAccent,
      accentColor: Colors.amber,
    ),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/Start': (context) => SelectionPage(),
      '/Next': (context) => LanguageScreen(),
      '/English': (context) => StartIntoApp(), // THIS FOR ENGLISH BUTTON
      '/Skip': (context) => SectorPage(),
    },
  ));
}

// Here Is Page Specification //
// * SplashScreen(Front page : Budget logo ,text ,quot ,start button)
// * StartIntoApp page : (Third page : Ministry section & Sector selection section with card-scroll)
// * SelectionPage(Second page : State selection, Drop-box, selected state-declaration)
// * LanguagePage(Fourth Page : which will display after selecting sector )

/*
  1)  Remaining ITEMS : make StartIntoApp(HINDI version) with new Dart.File
  2)  Than Connect that file with LanguageScreen's => Hindi FLAT BUTTON
   */
